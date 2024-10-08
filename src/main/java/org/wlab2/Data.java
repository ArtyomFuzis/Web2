package org.wlab2;

import org.json.simple.JSONObject;

import java.util.ArrayList;

public class Data
{
    public Double x;
    public Double y;
    public Double r;
    public Boolean res;
    public Data(Double x, Double y, Double r, Boolean res)
    {
        this.x = x;
        this.y = y;
        this.r = r;
        this.res = res;
    }
    public static String save(ArrayList<Data> data) {
        JSONObject write_arr = new JSONObject();
        for(int i = 0 ; i < data.size() ; i++)
        {
            JSONObject write_obj = new JSONObject();
            Data _obj = data.get(i);
            write_obj.put("x",_obj.x);
            write_obj.put("y",_obj.y);
            write_obj.put("r",_obj.r);
            write_obj.put("res",_obj.res);
            write_arr.put(i,write_obj);
        }
        var res_object = new JSONObject();
        res_object.put("data",write_arr);
        return res_object.toJSONString();
    }
}
