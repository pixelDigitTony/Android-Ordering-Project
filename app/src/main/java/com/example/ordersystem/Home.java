package com.example.ordersystem;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;


import com.kosalgeek.asynctask.AsyncResponse;
import com.kosalgeek.asynctask.PostResponseAsyncTask;

import java.util.HashMap;

import com.example.ordersystem.Common.Common;


public class Home extends AppCompatActivity implements AsyncResponse, View.OnClickListener {
    Button logB, regB;
    EditText userT, passT;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home);

        logB = (Button)findViewById(R.id.logButton);
        regB = (Button)findViewById(R.id.regButton);
        userT = (EditText)findViewById(R.id.userLog);
        passT = (EditText)findViewById(R.id.passLog);
        logB.setOnClickListener(this);

        regB.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(Home.this, "Loading", Toast.LENGTH_SHORT).show();
                startActivity(new Intent(Home.this, register.class));
            }
        });


        userT.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                userT.getText().clear();
            }
        });
        passT.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                passT.getText().clear();
            }
        });
    }
    @Override
    public void processFinish(String result) {
       if(result.equals("Manager")){
           Common.currentUser = userT.getText().toString();
           Common.currentPass = passT.getText().toString();
           Common.currentType = result;
            Toast.makeText(this, result, Toast.LENGTH_SHORT).show();
            Intent orderMenuIntent = new Intent(Home.this, orderMenu.class);
              startActivity(orderMenuIntent);
          }
        else {
            Toast.makeText(this, "Login Failed", Toast.LENGTH_SHORT).show();
        }


    }

    @Override
    public void onClick(View v) {
        HashMap postData = new HashMap();
        postData.put("mobile", "android");
        postData.put("txtUser", userT.getText().toString());
        postData.put("txtPass", passT.getText().toString());

        PostResponseAsyncTask task = new PostResponseAsyncTask(Home.this, postData, Home.this);
        task.execute("http://10.0.2.2/client/login.php");
    }
}
