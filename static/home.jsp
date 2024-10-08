<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="icon" type="image/png" href="img/favicon.png">
    <link rel="stylesheet" type="text/css" href="index.css">
    <title>Лабораторная работа №2</title>
    <script
            src="https://code.jquery.com/jquery-3.7.1.js"
            integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
            crossorigin="anonymous"></script>
    <script src="index.js" charset="utf-8"></script>
</head>
<body>
    <header>
        <h2>Лабораторная работа №2</h2>
        <h4>Выполнил: Назин Артем Аркадьевич P3207, ИСУ: 365395, вариант: 365395</h4>
    </header>
    <table>
        <tr>
            <td>Выберите X:</td>
            <td><div class="check_x ctrl"><input class="ch_x" type="checkbox"><span class="check_txt">-5</span></div></td>
            <td><div class="check_x ctrl"><input class="ch_x" type="checkbox"><span class="check_txt">-4</span></div></td>
            <td><div class="check_x ctrl"><input class="ch_x" type="checkbox"><span class="check_txt">-3</span></div></td>
            <td></td>
            <td></td>
            <td colspan="4" rowspan="7">
                <svg width="500"
                height="500"
                id = "img"
                xmlns="http://www.w3.org/2000/svg"
                viewBox="0 0 400 400">
                    <line x1="0" y1="50%" x2="100%" y2="50%" stroke="#111111"></line>
                    <line x1="50%" y1="0" x2="50%" y2="100%" stroke="#111111"></line>
                    <text x="88%" y="57%" class="graph_R">R</text>
                    <line x1="90%" y1="52%" x2="90%" y2="48%" stroke="#111111"></line>
                    <text x="68%" y="57%" class="graph_R2">R/2</text>
                    <line x1="70%" y1="52%" x2="70%" y2="48%" stroke="#111111"></line>
                    <text x="28%" y="57%" class="graph_MR2">-R/2</text>
                    <line x1="30%" y1="52%" x2="30%" y2="48%" stroke="#111111"></line>
                    <text x="8%" y="57%" class="graph_MR">-R</text>
                    <line x1="10%" y1="52%" x2="10%" y2="48%" stroke="#111111"></line>
                    <text x="53%" y="11%" class="graph_R">R</text>
                    <line x1="48%" y1="10%" x2="52%" y2="10%" stroke="#111111"></line>
                    <text x="53%" y="31%" class="graph_R2">R/2</text>
                    <line x1="48%" y1="30%" x2="52%" y2="30%" stroke="#111111"></line>
                    <text x="53%" y="71%" class="graph_MR2">-R/2</text>
                    <line x1="48%" y1="70%" x2="52%" y2="70%" stroke="#111111"></line>
                    <text x="53%" y="91%" class="graph_MR">-R</text>
                    <line x1="48%" y1="90%" x2="52%" y2="90%" stroke="#111111"></line>
                    <text x="53%" y="4%">x</text>
                    <text x="97.5%" y="55.5%">y</text>
                    <path d="M 385 195 l 15 5 l -15 5 z"  stroke="#111111" fill="#111111"></path>
                    <path d="M 205 15 l -5 -15 l -5 15 z"  stroke="#111111" fill="#111111"></path>
                    <path d="M 200 200 L 200 40 L 40 200 Z"  fill-opacity="0.6" stroke="#111111" fill="blue" stroke-width="2"></path>
                    <path d="M 40 200 L 40 280 L 200 280 L 200 200 Z"  fill-opacity="0.6" stroke="#111111" fill="blue" stroke-width="2"></path>
                    <path d="M 200 200 L 200 120 A 80 80 0 0 1 280 200 Z"  fill-opacity="0.6" stroke="#111111" fill="blue" stroke-width="2"></path>
                </svg>
            </td>
        </tr>
        <tr>
            <td></td>
            <td><div class="check_x ctrl"><input class="ch_x" type="checkbox"><span class="check_txt">-2</span></div></td>
            <td><div class="check_x ctrl"><input class="ch_x" type="checkbox"><span class="check_txt">-1</span></div></td>
            <td><div class="check_x ctrl"><input class="ch_x" type="checkbox"><span class="check_txt">0</span></div></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td><div class="check_x ctrl"><input class="ch_x" type="checkbox"><span class="check_txt">1</span></div></td>
            <td><div class="check_x ctrl"><input class="ch_x" type="checkbox"><span class="check_txt">2</span></div></td>
            <td><div class="check_x ctrl"><input class="ch_x" type="checkbox"><span class="check_txt">3</span></div></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>Набирите Y:</td>
            <td colspan="3"><input id="inp_y" type="text"></td>
        </tr>
        <tr>
            <td>Выберите R:</td>
            <td><div class="check_r ctrl"><input class="ch_r" type="checkbox"><span class="radio_txt">1</span></div></td>
            <td><div class="check_r ctrl"><input class="ch_r" type="checkbox"><span class="radio_txt">1.5</span></div></td>
            <td><div class="check_r ctrl"><input class="ch_r" type="checkbox"><span class="radio_txt">2</span></div></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td><div class="check_r ctrl"><input class="ch_r" type="checkbox"><span class="radio_txt">2.5</span></div></td>
            <td><div class="check_r ctrl"><input class="ch_r" type="checkbox"><span class="radio_txt">3</span></div></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td colspan="3"><button id="submit" type="submit">Отправить</button></td>
        </tr>
        <tr>
            <td></td>
            <td colspan="3" ><div id = "row_res" hidden></div></td>
        </tr>
        <tr>
            <td></td>
            <td colspan="3">
                <div id="res_table_div">
                    <table id="res_table">
                        <thead>
                        <td>X</td>
                        <td>Y</td>
                        <td>R</td>
                        <td>Результат</td>
                        </thead>
                    </table>
                </div>
            </td>

        </tr>
    </table>
</body>
</html>