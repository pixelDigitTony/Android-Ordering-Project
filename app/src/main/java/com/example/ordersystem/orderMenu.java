package com.example.ordersystem;

import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.support.design.widget.NavigationView;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.TextView;
import android.widget.Toast;

import com.example.ordersystem.Model.Category;
import com.example.ordersystem.ViewHolder.MenuAdapter;
import com.kosalgeek.asynctask.AsyncResponse;
import com.kosalgeek.asynctask.PostResponseAsyncTask;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.example.ordersystem.Common.Common;


public class orderMenu extends AppCompatActivity
        implements AsyncResponse, NavigationView.OnNavigationItemSelectedListener, MenuAdapter.ItemClickListener {

    public static final String EXTRA_TEXT = "com.example.ordersystem.EXTRA_NUMBER";

    RecyclerView recyclerView;
    MenuAdapter adapter;
    List<Category> categoryList;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_order_menu);

        categoryList = new ArrayList<>();

        recyclerView = (RecyclerView) findViewById(R.id.recycler_menu);
        recyclerView.setHasFixedSize(true);
        recyclerView.setLayoutManager(new LinearLayoutManager(this));

        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        toolbar.setTitle("Menu");
        setSupportActionBar(toolbar);

        FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent cartIntent = new Intent(orderMenu.this, Cart.class);
                startActivity(cartIntent);
            }
        });

        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(orderMenu.this, drawer, toolbar, R.string.navigation_drawer_open, R.string.navigation_drawer_close);
        drawer.setDrawerListener(toggle);
        toggle.syncState();

        NavigationView navigationView = (NavigationView) findViewById(R.id.nav_view);
        navigationView.setNavigationItemSelectedListener(this);

        View headerview = navigationView.getHeaderView(0);

        adapter = new MenuAdapter(this, categoryList, this);
        recyclerView.setAdapter(adapter);


        loadAll();

        HashMap postData = new HashMap();
        postData.put("mobile", "android");
        postData.put("txtUser", Common.currentUser);
        postData.put("txtPass", Common.currentPass);

        PostResponseAsyncTask task = new PostResponseAsyncTask(orderMenu.this, postData, orderMenu.this);
        task.execute("http://10.0.2.2/client/name.php");
    }

    private void loadAll() {
        categoryList.add(
                new Category(
                        1,
                        "Meals",
                        R.drawable.ic_launcher_background
                )
        );
        categoryList.add(
                new Category(
                        2,
                        "Merienda",
                        R.drawable.ic_launcher_background
                )
        );
        categoryList.add(
                new Category(
                        3,
                        "Pastries",
                        R.drawable.ic_launcher_background
                )
        );

    }


    @Override
    public void onBackPressed() {
        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        if (drawer.isDrawerOpen(GravityCompat.START)) {
            drawer.closeDrawer(GravityCompat.START);
        } else {
            super.onBackPressed();
        }
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.order_menu, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        return super.onOptionsItemSelected(item);
    }

    @SuppressWarnings("StatementWithEmptyBody")
    @Override
    public boolean onNavigationItemSelected(MenuItem item) {
        // Handle navigation view item clicks here.
        int id = item.getItemId();

        if (id == R.id.nav_menu) {

        }
        else if (id == R.id.nav_cart){

        }
        else if (id == R.id.nav_order){

        }
        else if (id == R.id.nav_log_out){
            Intent orderMenuIntent = new Intent(orderMenu.this, Home.class);
            startActivity(orderMenuIntent);

            finishAfterTransition();

        }



        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        drawer.closeDrawer(GravityCompat.START);
        return true;
    }

    @Override
    public void processFinish(String result) {
        TextView user = (TextView)findViewById(R.id.txtName);
        user.setText(result);

    }


    @Override
    public void onClick(int position) {
        Toast.makeText(this, categoryList.get(position).getName(), Toast.LENGTH_SHORT).show();
        Intent intent = new Intent(this, orderDish.class);
        String menuId = categoryList.get(position).getName();
        intent.putExtra(EXTRA_TEXT, menuId);
        startActivity(intent);
    }
}
