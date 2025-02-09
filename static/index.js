$(function(){
    function show_res(s)
    {
        $("#row_res").removeAttr("hidden").html(s)
    }
    function add_row_end(x,y,r,msg)
    {
        $("#res_table")[0].innerHTML+=`<tr class="add_row">\n` +
            `                        <td>${x}</td>\n` +
            `                        <td>${y}</td>\n` +
            `                        <td>${r}</td>\n` +
            `                        <td>${msg}</td>\n` +
            `                        </tr>`;
    }
    function add_point(x,y,r,res)
    {
        x_r = (x/r)*160+200
        y_r = (-y/r)*160+200
        let color = res ? "green" : "red"
        $("#img")[0].innerHTML+=`<circle cx="${x_r}" cy="${y_r}" r="2" class = "add_point" fill="${color}" stroke="${color}"/>`;
    }
    function clear_row_points()
    {
        $(".add_row").remove()
        $(".add_point").remove()
    }
    $(".ch_x").click(function(){
        if(this.checked)
        {
            $(".ch_x").prop('checked', false)
            $(this).prop('checked', true)
        }
    });
    $(".ch_r").click(function(){
        if(this.checked)
        {
            $(".ch_r").prop('checked', false)
            $(this).prop('checked', true)
            let val = Number($(this).parent().children().last()[0].innerText)
            $(".graph_R").text(val)
            $(".graph_R2").text(val/2)
            $(".graph_MR").text(-val)
            $(".graph_MR2").text(-val/2)
        }
        else
        {
            $(".graph_R").text("R")
            $(".graph_R2").text("R/2")
            $(".graph_MR").text("-R")
            $(".graph_MR2").text("-R/2")
        }
    });
    $("#submit").click(function(){
        let ch_x = $(".ch_x:checked")
        let ch_r = $(".ch_r:checked")
        if(ch_x.length === 0 && ch_r.length === 0)
        {
            show_res("X и R не выбраны!")
        }
        else if(ch_x.length === 0)
        {
            show_res("X не выбран!")
        }
        else if(ch_r.length === 0)
        {
            show_res("R не выбран!")
        }
        else
        {
            let inp_y = $("#inp_y")[0].value.trim();
            if(inp_y.length === 0)
            {
                show_res("Y не выбран!")
            }
            else if(!inp_y.match("^-?\\d+(?:[\\.,]\\d+)?$"))
            {
                show_res("Y не является числовым значением!")
            }
            else {
                let parsed_y = parseFloat(inp_y.replace(",","."))
                if(parsed_y < -5 || parsed_y > 3)show_res("Y выходит за допустимые пределы!");
                else {

                    let x = ch_x.parent().children().last()[0].innerText
                    let r = ch_r.parent().children().last()[0].innerText
                    let y = parsed_y
                    to_send(x,r,y)
                }
            }
        }
    });
    $("#img").click(function(event){
        let ch_r = $(".ch_r:checked")
        if(ch_r.length === 0)
        {
            show_res("R не выбран!")
        }
        else
        {
            var pt = this.createSVGPoint()
            pt.x = event.clientX
            pt.y = event.clientY
            var cursorpt = pt.matrixTransform(this.getScreenCTM().inverse())
            let [x,y] = [cursorpt.x,cursorpt.y]
            //console.log("X~:"+x+" Y~: "+y)
            x=(x-200)/160;
            y=-(y-200)/160;
            let r = Number(ch_r.parent().children().last()[0].innerText)
            x*=r
            y*=r
            x = x.toFixed (3);
            y = y.toFixed (3);
            to_send(x,r,y)
        }
    });
    function to_send(x,r,y)
    {
        let data = {
            x: x,
            r: r,
            y: y,
        }
        $.ajax({
            type: "POST",
            url: "./home",
            data,
            success: function (msg) {
                let datares = msg["data"]
                let res = []
                clear_row_points()
                for (key in datares) {
                    let val = datares[key]
                    let str_res = val["res"] ? "Есть попадение" : "Не попал"
                    add_row_end(val["x"],val["y"],val["r"],str_res)
                    add_point(val["x"],val["y"],val["r"],val["res"])
                    show_res(str_res)
                }
                //console.log(res)
            }
        });
    }
    $.ajax({
        type: "POST",
        url: "./home",
        success: function (msg) {
            let datares = msg["data"]
            let res = []
            clear_row_points()
            for (key in datares) {
                let val = datares[key]
                let str_res = val["res"] ? "Есть попадение" : "Не попал"
                add_row_end(val["x"],val["y"],val["r"],str_res)
                add_point(val["x"],val["y"],val["r"],val["res"])
            }
            //console.log(res)
        }
    });
});
