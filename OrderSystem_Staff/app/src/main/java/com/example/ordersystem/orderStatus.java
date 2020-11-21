package com.example.ordersystem;

import android.content.DialogInterface;
import android.content.Intent;
import android.os.Handler;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;

import com.example.ordersystem.Common.Common;
import com.example.ordersystem.Common.PassBill;
import com.example.ordersystem.Interface.ItemClickListener;
import com.example.ordersystem.Model.Request;
import com.example.ordersystem.ViewHolder.OrderAdapter;
import com.kosalgeek.asynctask.AsyncResponse;
import com.kosalgeek.asynctask.PostResponseAsyncTask;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;

public class orderStatus extends AppCompatActivity implements AsyncResponse, ItemClickListener {


    public RecyclerView recyclerView;
    public RecyclerView.LayoutManager layoutManager;
    OrderAdapter adapter;
    Button goBack;
    List<Request> requestList;
    boolean task = false;



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_order_status);

        verifyAvailability();

        requestList = new ArrayList<>();

        recyclerView = (RecyclerView)findViewById(R.id.listOrders);
        recyclerView.setHasFixedSize(true);
        layoutManager = new LinearLayoutManager(this);
        recyclerView.setLayoutManager(layoutManager);
        goBack = (Button)findViewById(R.id.go_back_viewOrder);



        final Handler handler = new Handler();
        handler.postDelayed( new Runnable() {

            @Override
            public void run() {

                requestList.clear();
                loadOrders();
                adapter.notifyDataSetChanged();

                handler.postDelayed( this, 15 * 1000 );
            }
        }, 15 * 1000 );


        loadOrders();

        goBack.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });


    }

    @Override
    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);

    }


    private void verifyAvailability() {
        HashMap postData = new HashMap();
        postData.put("mobile", "android");
        postData.put("txtUser", Common.currentUser);
        postData.put("txtPass", Common.currentPass);
        postData.put("txtAccountType", Common.currentType);

        PostResponseAsyncTask task = new PostResponseAsyncTask(orderStatus.this, postData, new AsyncResponse() {
            @Override
            public void processFinish(String results) {
                Log.i("tagconvertstr", "["+results+"]");
                try {
                    JSONArray products = new JSONArray(results);
                    for (int i = 0; i < products.length(); i++) {

                        JSONObject dishesObject = products.getJSONObject(i);

                        int dishStatusID = dishesObject.getInt("dishStatusID");
                        String dishStatusName = dishesObject.getString("dishStatusName");
                        int dishStatusOrderT = Integer.parseInt(dishesObject.getString("dishStatusOrderT"));
                        int dishStatusAvailT = Integer.parseInt(dishesObject.getString("dishStatusAvailT"));

                        if(dishStatusOrderT>dishStatusAvailT){
                            if(Common.currentType.equals("CUSTOMER")) {

                            }else{
                                showAlertDialogPending(dishStatusName);
                            }
                        }

                    }


                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        });
        task.execute("http://10.0.2.2/client/verifyAvailabilityPending.php");


        HashMap postData2 = new HashMap();
        postData2.put("mobile", "android");
        postData2.put("txtUser", Common.currentUser);
        postData2.put("txtPass", Common.currentPass);
        postData2.put("txtAccountType", Common.currentType);

        PostResponseAsyncTask task2 = new PostResponseAsyncTask(orderStatus.this, postData, new AsyncResponse() {
            @Override
            public void processFinish(String results) {
                Log.i("tagconvertstr", "["+results+"]");
                try {
                    JSONArray products = new JSONArray(results);
                    for (int i = 0; i < products.length(); i++) {

                        JSONObject dishesObject = products.getJSONObject(i);

                        int dishStatusID = dishesObject.getInt("dishStatusID");
                        String dishStatusName = dishesObject.getString("dishStatusName");
                        int dishStatusOrderT =  Integer.parseInt(dishesObject.getString("dishStatusOrderT"));
                        int dishStatusAvailT = Integer.parseInt(dishesObject.getString("dishStatusAvailT"));

                        if(dishStatusOrderT>dishStatusAvailT){
                            showAlertDialogComplete(dishStatusName);
                        }

                    }


                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        });
        task2.execute("http://10.0.2.2/client/verifyAvailabilityComplete.php");
    }

    private void showAlertDialogPending(String dishStatusName) {
        final AlertDialog.Builder alertDialog = new AlertDialog.Builder(orderStatus.this);
        alertDialog.setTitle("Warning");
        alertDialog.setMessage("Pending Orders have exceeded available stocks of "+dishStatusName);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.MATCH_PARENT
        );
        alertDialog.setPositiveButton("Ok", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                dialog.dismiss();
            }
        });
        alertDialog.show();
    }

    private void showAlertDialogComplete(String dishStatusName) {
        final AlertDialog.Builder alertDialog = new AlertDialog.Builder(orderStatus.this);
        alertDialog.setTitle("Danger");
        alertDialog.setMessage("Completed Orders have exceeded available stocks of "+dishStatusName);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.MATCH_PARENT
        );
        alertDialog.setPositiveButton("Ok", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                dialog.dismiss();
            }
        });
        alertDialog.show();
    }


    private void loadOrders() {



        HashMap postData = new HashMap();
        postData.put("mobile", "android");
        postData.put("txtUser", Common.currentUser);
        postData.put("txtPass", Common.currentPass);
        postData.put("txtType", Common.currentType);

        PostResponseAsyncTask task = new PostResponseAsyncTask(orderStatus.this, postData, orderStatus.this);
        task.execute("http://10.0.2.2/client/viewOrders.php");

    }


    @Override
    public void processFinish(String results) {
        int x =1;
        try {

            Log.i("tagconvertstr", "["+results+"]");
            JSONArray products = new JSONArray(results);

            for (int i = products.length() - 1; i >= 0;i--){

                JSONObject dishesObject = products.getJSONObject(i);

                int requestNumber = dishesObject.getInt("idOrders");
                String requestTime = dishesObject.getString(String.valueOf("dateTime"));
                String requestStatus = dishesObject.getString("status");
                String requestCater = dishesObject.getString("cater");
                String requestFirstName = dishesObject.getString("firstName");
                String requestLastName = dishesObject.getString("lastName");
                String requestTotal = dishesObject.getString("total");
                String requestName = requestFirstName + " " + requestLastName;

                requestList.add(new Request(x, requestNumber, requestTime, requestStatus, requestCater, requestName, requestTotal));
                x++;
            }
            adapter = new OrderAdapter(this, requestList, this);
            recyclerView.setAdapter(adapter);



        } catch (JSONException e){
            e.printStackTrace();
        }
    }



    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        adapter.notifyDataSetChanged();
    }

    @Override
    public void onClick(int position) {

        PassBill.billID = (requestList.get(position).getrequestNumber());
        PassBill.billNAME = (requestList.get(position).getRequestName());
        PassBill.billDATE = (requestList.get(position).getRequestdateTime());
        PassBill.billSTATUS = (requestList.get(position).getRequestStatus());
        PassBill.billCATER = (requestList.get(position).getRequestCater());
        PassBill.billTOTAL = (requestList.get(position).getRequestTotal());

        Intent intent = new Intent(this, orderBill.class);
        startActivity(intent);
        stopLockTask();
    }

}
