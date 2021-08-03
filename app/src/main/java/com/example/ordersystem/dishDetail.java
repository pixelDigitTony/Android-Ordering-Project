package com.example.ordersystem;

import android.content.Intent;
import android.support.design.widget.CollapsingToolbarLayout;
import android.support.design.widget.FloatingActionButton;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.cepheuen.elegantnumberbutton.view.ElegantNumberButton;
import com.example.ordersystem.Common.Data;
import com.example.ordersystem.Database.Database;
import com.example.ordersystem.Model.Dish;
import com.example.ordersystem.Model.Order;
import com.squareup.picasso.Picasso;

public class dishDetail extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_dish_detail);

        TextView dishName, dishPrice;
        ImageView dishImage;
        CollapsingToolbarLayout collapsingToolbarLayout;
        FloatingActionButton btnCart;
        final ElegantNumberButton numberButton;



        numberButton = (ElegantNumberButton)findViewById(R.id.number_button);
        btnCart = (FloatingActionButton)findViewById(R.id.btnCart);



        dishName = (TextView)findViewById(R.id.dish_detail);
        dishPrice = (TextView)findViewById(R.id.dish_price);
        dishImage = (ImageView)findViewById(R.id.dish_image);


        collapsingToolbarLayout = (CollapsingToolbarLayout)findViewById(R.id.collapsing);
        collapsingToolbarLayout.setExpandedTitleTextAppearance(R.style.ExpandedAppbar);
        collapsingToolbarLayout.setCollapsedTitleTextAppearance(R.style.CollapsedAppbar);


        Intent i = getIntent();
        final String dishId = String.valueOf(Data.dishID);
        final String dishNAME = Data.dishNAME;
        final String dishPRICE = String.valueOf(Data.dishPRICE);


        dishName.setText(dishNAME);
        dishPrice.setText(dishPRICE);

        collapsingToolbarLayout.setTitle(dishNAME);

        btnCart.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                new Database(getApplicationContext()).addToCart(new Order(
                        dishId,
                        dishNAME,
                        dishPRICE,
                        numberButton.getNumber()
                ));
                Toast.makeText(dishDetail.this, "Added to Cart", Toast.LENGTH_SHORT).show();
            }
        });

    }

}
