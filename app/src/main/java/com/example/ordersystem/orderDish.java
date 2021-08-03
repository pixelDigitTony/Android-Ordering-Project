package com.example.ordersystem;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;

import com.example.ordersystem.Common.Common;
import com.example.ordersystem.Common.Data;
import com.example.ordersystem.Model.Dish;
import com.example.ordersystem.ViewHolder.DishAdapter;
import com.kosalgeek.asynctask.AsyncResponse;
import com.kosalgeek.asynctask.PostResponseAsyncTask;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class orderDish extends AppCompatActivity implements AsyncResponse, DishAdapter.ItemClickListener {


    RecyclerView recyclerView;
    DishAdapter adapter;
    List<Dish> dishList;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_dishlist);
        dishList = new ArrayList<>();

        recyclerView = (RecyclerView) findViewById(R.id.recycler_food);
        recyclerView.setHasFixedSize(true);
        recyclerView.setLayoutManager(new LinearLayoutManager(this));
        

        Intent i = getIntent();
        String menuID = i.getStringExtra(orderMenu.EXTRA_TEXT);
        if(getIntent() != null)
            if(!menuID.isEmpty() && menuID != null) {
                dishListFood(menuID);
            }

    }

    private void dishListFood(String menuID) {

            if (menuID.equals("Meals")) {
               loadMeals();
            } else if (menuID.equals("Merienda")) {
                loadMerienda();
            } else if (menuID.equals("Pastries")) {
                loadPastries();
            } else {
                dishList.add(
                        new Dish(
                                4,
                                "error",
                                0,
                                R.drawable.ic_launcher_background
                        )
                );
            }
    }

    private void loadPastries() {
        HashMap postData = new HashMap();
        postData.put("mobile", "android");
        postData.put("txtUser", Common.currentUser);
        postData.put("txtPass", Common.currentPass);

        PostResponseAsyncTask task = new PostResponseAsyncTask(orderDish.this, postData, orderDish.this);
        task.execute("http://10.0.2.2/client/pastry.php");
    }

    private void loadMerienda() {
        HashMap postData = new HashMap();
        postData.put("mobile", "android");
        postData.put("txtUser", Common.currentUser);
        postData.put("txtPass", Common.currentPass);

        PostResponseAsyncTask task = new PostResponseAsyncTask(orderDish.this, postData, orderDish.this);
        task.execute("http://10.0.2.2/client/merienda.php");
    }

    private void loadMeals() {
        HashMap postData = new HashMap();
        postData.put("mobile", "android");
        postData.put("txtUser", Common.currentUser);
        postData.put("txtPass", Common.currentPass);

        PostResponseAsyncTask task = new PostResponseAsyncTask(orderDish.this, postData, orderDish.this);
        task.execute("http://10.0.2.2/client/meal.php");
    }


    @Override
    public void onClick(int position) {

        Intent intent = new Intent(this, dishDetail.class);
        int dishId = dishList.get(position).getDishId();
        String dishName = dishList.get(position).getDishName();
        int dishPrice = dishList.get(position).getDishPrice();
        Data.dishID = dishId;
        Data.dishNAME = dishName;
        Data.dishPRICE = dishPrice;
        startActivity(intent);
    }

    @Override
    public void processFinish(String results) {
        try {
            JSONArray products = new JSONArray(results);
            for (int i = 0; i < products.length();i++){

                JSONObject dishesObject = products.getJSONObject(i);

                int dishId = dishesObject.getInt("idavailDish");
                String dishName = dishesObject.getString("name");
                int dishPrice = dishesObject.getInt("price");

                dishList.add(new Dish(dishId, dishName, dishPrice, R.drawable.ic_launcher_background));

            }
            adapter = new DishAdapter(this, dishList, this);
            recyclerView.setAdapter(adapter);
        } catch (JSONException e){
            e.printStackTrace();
        }
    }
}