package com.example.ordersystem;

import android.content.DialogInterface;
import android.support.design.button.MaterialButton;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.example.ordersystem.Common.Common;
import com.example.ordersystem.Common.Data;
import com.example.ordersystem.Database.Database;
import com.example.ordersystem.Model.Dish;
import com.example.ordersystem.Model.Order;
import com.example.ordersystem.ViewHolder.CartAdapter;
import com.kosalgeek.asynctask.AsyncResponse;
import com.kosalgeek.asynctask.PostResponseAsyncTask;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

public class Cart extends AppCompatActivity implements AsyncResponse {

    RecyclerView recyclerView;
    RecyclerView.LayoutManager layoutManager;

    List<Order> cart = new ArrayList<>();
    CartAdapter adapter;

    TextView txtTotalPrice;
    MaterialButton btnPlace;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_cart);



        recyclerView = (RecyclerView)findViewById(R.id.listCart);
        recyclerView.setHasFixedSize(true);
        layoutManager = new LinearLayoutManager(this);
        recyclerView.setLayoutManager(layoutManager);

        txtTotalPrice=(TextView)findViewById(R.id.total);
        btnPlace = (MaterialButton)findViewById(R.id.btnPlaceOrder);

        loadListFood();

        btnPlace.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                showAlertDialog();
            }
        });
        


    }

    private void showAlertDialog() {
        Toast.makeText(this, Common.currentType+Data.dishtotalPrice, Toast.LENGTH_SHORT).show();
        AlertDialog.Builder alertDialog = new AlertDialog.Builder(Cart.this);
        alertDialog.setTitle("Confirm Order");
        alertDialog.setMessage("Is this your final selection?");
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.MATCH_PARENT
        );
        alertDialog.setPositiveButton("YES", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                HashMap postData = new HashMap();
                postData.put("mobile", "android");
                postData.put("txtUser", Common.currentUser);
                postData.put("txtPass", Common.currentPass);
                postData.put("txtAccountType", Common.currentType);

                PostResponseAsyncTask task = new PostResponseAsyncTask(Cart.this, postData, Cart.this);
                task.execute("http://10.0.2.2/client/order.php");

                loadDishList();

                new Database(getBaseContext()).cleanCart();
                finish();
            }
        });

        alertDialog.setNegativeButton("NO", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
              dialog.dismiss();
            }
        });
        alertDialog.show();
    }

    private void loadDishList() {
        cart = new Database(this).getCart();
        adapter = new CartAdapter(cart,this);
        recyclerView.setAdapter(adapter);
        int total=0;
        for(Order order:cart) {
            HashMap postData = new HashMap();
            postData.put("mobile", "android");
            postData.put("txtUser", Common.currentUser);
            postData.put("txtPass", Common.currentPass);
            postData.put("txtAccountType", Common.currentType);

            postData.put("txtDishName", order.getFoodName());
            postData.put("txtQuantity", order.getFoodQuantity());

            PostResponseAsyncTask task = new PostResponseAsyncTask(Cart.this, postData, Cart.this);
            task.execute("http://10.0.2.2/client/orderDishes.php");
        }

    }

    private void loadListFood() {
        cart = new Database(this).getCart();
        adapter = new CartAdapter(cart,this);
        recyclerView.setAdapter(adapter);

        int total = 0;
        for(Order order:cart)
            total+=(Integer.parseInt(order.getFoodPrice()))*(Integer.parseInt(order.getFoodQuantity()));

        txtTotalPrice.setText(String.valueOf(total));
    }


    @Override
    public void processFinish(String result) {
        Toast.makeText(Cart.this, "Thank you, order placed!", Toast.LENGTH_SHORT).show();
    }
}
