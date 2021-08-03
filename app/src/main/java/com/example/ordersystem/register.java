package com.example.ordersystem;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.Toast;

import com.kosalgeek.asynctask.AsyncResponse;
import com.kosalgeek.asynctask.PostResponseAsyncTask;

import java.util.HashMap;

public class register extends AppCompatActivity implements AsyncResponse, View.OnClickListener{

    EditText userT, passT, mobT, nameT;
    Button cancelB, subB;
    RadioGroup typeSelG;
    RadioButton typeB;



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register);

        userT = (EditText)findViewById(R.id.user);
        passT = (EditText)findViewById(R.id.pass);
        mobT = (EditText)findViewById(R.id.mobNum);
        nameT = (EditText)findViewById(R.id.name);
        typeSelG = (RadioGroup)findViewById(R.id.typeSel);
        cancelB = (Button)findViewById(R.id.cancelButton);
        subB = (Button)findViewById(R.id.subButton);
        subB.setOnClickListener(this);

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
        mobT.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                mobT.getText().clear();
            }
        });
        nameT.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                nameT.getText().clear();
            }
        });

        cancelB.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(getApplicationContext(), "Cancelled", Toast.LENGTH_SHORT).show();
                userT.getText().clear();
                passT.getText().clear();
                mobT.getText().clear();
                nameT.getText().clear();
                typeSelG.clearCheck();
                startActivity(new Intent(register.this, Home.class));
            }
        });


    }

    @Override
    public void processFinish(String result) {
        Toast.makeText(this, result, Toast.LENGTH_SHORT).show();
        startActivity(new Intent(register.this, Home.class));
    }

    @Override
    public void onClick(View v) {
        typeB = (RadioButton) findViewById(typeSelG.getCheckedRadioButtonId());

        HashMap postData = new HashMap();
        postData.put("mobile", "android");
        postData.put("txtName", nameT.getText().toString());
        postData.put("txtUser", userT.getText().toString());
        postData.put("txtPass", passT.getText().toString());
        postData.put("txtAccountType", typeB.getText());
        postData.put("txtMobNum", mobT.getText().toString());

        PostResponseAsyncTask task = new PostResponseAsyncTask(this, postData, this);
        task.execute("http://10.0.2.2/client/register.php");


    }
}
