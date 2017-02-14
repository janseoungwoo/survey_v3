<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html >
<head>
    <meta charset="UTF-8">
    <title>Interactive Apple Watch Lap Timer/Stopwatch</title>
    <style>

        body {
            font-family: helvetica;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }
        h3 {
            font-weight: 100;
            font-size: 30px;
            text-align: center;
            padding-top: 10px;
            color: #000;
        }
        .hide {
            display: none !important;
        }

        .container {
            position: fixed;
            top: 50%;
            left: 50%;
            margin-left: -161px;
            margin-top: -250px;
        }

        .frame {
            width: 342px;
            height: 405px;
            margin: 0 auto;
            border-radius: 53px;
            box-shadow: inset 0 0 15px 1px #7f8082, inset 0 0 4px 0px #7f8082;
            position: relative;
            box-sizing: border-box;
            border: 1px solid #949494;
            overflow: hidden;
        }

        #watch {
            width: 310px;
            height: 375px;
            position: absolute;
            top: 15px;
            left: 15px;
            background-color: #000;
            border-radius: 40px;
            overflow: hidden;
            /*  box-shadow:
              0 0 0 1px #5d5d5d,
              0 0 0 1px #727272,
              inset 0 0 18px 4px #fff;*/

            box-shadow: 0 0 0 1px #5d5d5d, 0 0 6px 1px #5d5d5d, 0 0 0 1px #727272, inset 0 0 20px 3px #fff, inset 35px -10px 50px 0px rgba(255, 255, 255, 0.3), 279px 326px 45px -18px rgba(153, 153, 153, 0.6), 270px -321px 45px -18px rgba(153, 153, 153, 0.5), -266px 326px 45px -18px rgba(153, 153, 153, 0.4), -264px -330px 45px -18px rgba(153, 153, 153, 0.5);
            box-sizing: border-box;
        }

        .blur-top {
            position: absolute;
            top: -30px;
            left: 5%;
            width: 90%;
            height: 50px;
            border-radius: 20px;
            background: linear-gradient( rgba(255, 255, 255, 0.9), rgba(255, 255, 255, 0.25));
        }

        .face {
            width: 236px;
            height: 280px;
            position: absolute;
            top: 35px;
            left: 37px;
        }

        .row-1 > div {
            width: 50%;
            float: left;
            color: #fff;
            margin-bottom: 8px;
            font-weight: 100;
            font-size: 26px;
        }

        .row-1 .timer {
            text-align: left;
        }

        .row-1 .timer > span {
            float: left;
        }

        .row-1 .time {
            text-align: right;
            float: right;
        }

        .row-1 .time > span {
            float: right;
        }

        .row-2 .clock {
            width: 73px;
            height: 73px;
            float: left;
            border-radius: 75px;
            position: relative;
        }

        .c2 {
            margin-left: 8px;
            margin-right: 8px;
        }

        .c1 .bl:nth-child(38) {
            display: none;
        }

        i {
            width: 73px;
            height: 1px;
            background-color: #fff;
            position: absolute;
            top: 36px;
            transform-origin: 50% 50%;
        }

        .c i:nth-child(1) {
            transform: rotate(5deg);
        }

        .c i:nth-child(2) {
            transform: rotate(10deg);
        }

        .c i:nth-child(3) {
            transform: rotate(15deg);
        }

        .c i:nth-child(4) {
            transform: rotate(20deg);
        }

        .c i:nth-child(5) {
            transform: rotate(25deg);
        }

        .c i:nth-child(6) {
            transform: rotate(170deg);
        }

        .c i:nth-child(7) {
            transform: rotate(35deg);
        }

        .c i:nth-child(8) {
            transform: rotate(40deg);
        }

        .c i:nth-child(9) {
            transform: rotate(45deg);
        }

        .c i:nth-child(10) {
            transform: rotate(50deg);
        }

        .c i:nth-child(11) {
            transform: rotate(55deg);
        }

        .c i:nth-child(12) {
            transform: rotate(165deg);
        }

        .c i:nth-child(13) {
            transform: rotate(65deg);
        }

        .c i:nth-child(14) {
            transform: rotate(70deg);
        }

        .c i:nth-child(15) {
            transform: rotate(75deg);
        }

        .c i:nth-child(16) {
            transform: rotate(80deg);
        }

        .c i:nth-child(17) {
            transform: rotate(85deg);
        }

        .c i:nth-child(18) {
            transform: rotate(180deg);
        }

        .c i:nth-child(19) {
            transform: rotate(95deg);
        }

        .c i:nth-child(20) {
            transform: rotate(100deg);
        }

        .c i:nth-child(21) {
            transform: rotate(105deg);
        }

        .c i:nth-child(22) {
            transform: rotate(110deg);
        }

        .c i:nth-child(23) {
            transform: rotate(115deg);
        }

        .c i:nth-child(24) {
            transform: rotate(160deg);
        }

        .c i:nth-child(25) {
            transform: rotate(125deg);
        }

        .c i:nth-child(26) {
            transform: rotate(130deg);
        }

        .c i:nth-child(27) {
            transform: rotate(135deg);
        }

        .c i:nth-child(28) {
            transform: rotate(140deg);
        }

        .c i:nth-child(29) {
            transform: rotate(145deg);
        }

        .c i:nth-child(30) {
            transform: rotate(175deg);
        }

        .c i:nth-child(31) {
            transform: rotate(155deg);
        }

        .c i:nth-child(32) {
            transform: rotate(120deg);
        }

        .c i:nth-child(33) {
            transform: rotate(60deg);
        }

        .c i:nth-child(35) {
            transform: rotate(30deg);
        }

        .c i:nth-child(36) {
            transform: rotate(150deg);
        }

        .c i:nth-child(37) {
            transform: rotate(90deg);
        }

        .c i:nth-child(38) {
            transform: rotate(120deg);
        }
        /** Second Clock **/

        .d i:nth-child(1) {
            transform: rotate(3.6deg);
        }

        .d i:nth-child(2) {
            transform: rotate(10.8deg);
        }

        .d i:nth-child(3) {
            transform: rotate(147.6deg);
        }

        .d i:nth-child(4) {
            transform: rotate(25.2deg);
        }

        .d i:nth-child(5) {
            transform: rotate(32.4deg);
        }

        .d i:nth-child(6) {
            transform: rotate(39.6deg);
        }

        .d i:nth-child(7) {
            transform: rotate(46.8deg);
        }

        .d i:nth-child(8) {
            transform: rotate(154.8deg);
        }

        .d i:nth-child(9) {
            transform: rotate(61.2deg);
        }

        .d i:nth-child(10) {
            transform: rotate(68.4deg);
        }

        .d i:nth-child(11) {
            transform: rotate(75.6deg);
        }

        .d i:nth-child(12) {
            transform: rotate(82.8deg);
        }

        .d i:nth-child(13) {
            transform: rotate(176.4deg);
        }

        .d i:nth-child(14) {
            transform: rotate(97.2deg);
        }

        .d i:nth-child(15) {
            transform: rotate(104.4deg);
        }

        .d i:nth-child(16) {
            transform: rotate(111.6deg);
        }

        .d i:nth-child(17) {
            transform: rotate(118.8deg);
        }

        .d i:nth-child(18) {
            transform: rotate(169.2deg);
        }

        .d i:nth-child(19) {
            transform: rotate(133.2deg);
        }

        .d i:nth-child(20) {
            transform: rotate(140.4deg);
        }

        .d i:nth-child(22) {
            transform: rotate(18deg);
            /* 147.6*/
        }

        .d i:nth-child(23) {
            transform: rotate(54deg);
            /* 154.8*/
        }

        .d i:nth-child(24) {
            transform: rotate(90deg);
            /*162*/
        }

        .d i:nth-child(25) {
            transform: rotate(126deg);
            /*169.2*/
        }

        .d i:nth-child(26) {
            transform: rotate(162deg);
            /*176.4*/
        }

        .inner-cover,
        .outer-cover {
            position: absolute;
            background: #000;
            border-radius: 100%;
        }

        .inner-cover {
            width: 65px;
            height: 65px;
            top: 4px;
            left: 4px;
        }

        .outer-cover {
            width: 59px;
            height: 59px;
            top: 7px;
            left: 7px;
        }

        .ns b {
            position: absolute;
            color: #fff;
            font-family: helvetica;
            font-weight: 100;
            font-size: 12px;
            /*-webkit-font-smoothing: antialiased;*/
        }
        /* Clock 1 Numbers */

        .ns1 b:nth-child(1) {
            top: 20px;
            left: 47px;
        }

        .ns1 b:nth-child(2) {
            top: 40px;
            left: 47px;
        }

        .ns1 b:nth-child(3) {
            top: 52px;
            left: 30px;
        }

        .ns1 b:nth-child(4) {
            top: 40px;
            left: 13px;
        }

        .ns1 b:nth-child(5) {
            top: 20px;
            left: 13px;
        }

        .ns1 b:nth-child(6) {
            top: 8px;
            left: 30px;
        }
        /* Clock 2 Numbers */

        .ns2 b:nth-child(1) {
            top: 30px;
            left: 50px;
        }

        .ns2 b:nth-child(2) {
            top: 52px;
            left: 30px;
        }

        .ns2 b:nth-child(3) {
            top: 30px;
            left: 10px;
        }

        .ns2 b:nth-child(4) {
            top: 8px;
            left: 30px;
        }
        /* Clock 3 Numbers */

        .ns3 b:nth-child(1) {
            top: 10px;
            left: 47px;
        }

        .ns3 b:nth-child(2) {
            top: 21px;
            left: 56px;
        }

        .ns3 b:nth-child(3) {
            top: 37px;
            left: 56px;
        }

        .ns3 b:nth-child(4) {
            top: 48px;
            left: 47px;
        }

        .ns3 b:nth-child(5) {
            top: 52px;
            left: 33.5px;
        }

        .ns3 b:nth-child(6) {
            top: 48px;
            left: 19px;
        }

        .ns3 b:nth-child(7) {
            top: 38px;
            left: 11px;
        }

        .ns3 b:nth-child(8) {
            top: 22px;
            left: 11px;
        }

        .ns3 b:nth-child(9) {
            top: 10px;
            left: 20px;
        }

        .ns3 b:nth-child(10) {
            top: 8px;
            left: 33.5px;
        }

        .pin {
            position: absolute;
            width: 6px;
            height: 6px;
            background-color: #ff990c;
            border-radius: 4px;
            top: 50%;
            left: 50%;
            margin-top: -3px;
            margin-left: -3px;
        }

        .hand {
            position: absolute;
            width: 37.5px;
            height: 2px;
            background-color: #ff990c;
            top: 50%;
            left: 50%;
            margin-top: -1px;
            margin-left: -1px;
            /*animation: rotate 60s infinite linear;*/

            transform-origin: 1px 50%;
            transform: rotate(-90deg);
        }

        .go .c1 .hand {
            animation: rotate 21600s infinite linear;
        }

        .go .c2 .hand {
            animation: rotate 60s infinite linear;
        }

        .go .c3 .hand {
            animation: rotate 1s infinite linear;
        }

        .go.pause .c1 .hand {
            animation-play-state: paused;
        }

        .go.pause .c2 .hand {
            animation-play-state: paused;
        }

        .go.pause .c3 .hand {
            animation-play-state: paused;
        }

        .reset .c1 .hand {
            transform: rotate(-90deg);
        }

        .reset .c2 .hand {
            transform: rotate(-90deg);
        }

        .reset .c3 .hand {
            transform: rotate(-90deg);
        }

        @keyframes rotate {
            0% {
                transform: rotate(-90deg);
            }
            100% {
                transform: rotate(270deg);
            }
        }

        .lap_timer {
            width: 100%;
            color: #fff;
            margin: 0;
            padding: 0;
            margin-bottom: 8px;
            font-family: helvetica;
            font-weight: 100;
            font-size: 60px;
            line-height: 60px;
            text-align: center;
            /*-webkit-font-smoothing: antialiased;*/

            clear: both;
        }

        .lap_timer span {
            float: left;
            width: 8%;
            text-align: center;
        }

        #lap_min,
        #lap_sec,
        #lap_ms {
            width: 28%;
        }

        .ctrls {
            clear: both;
        }

        .ctrls a {
            display: block;
            float: left;
            text-align: center;
            width: 49%;
            font-family: helvetica;
            font-weight: 200;
            font-size: 22px;
            letter-spacing: 1px;
            text-align: center;
            text-decoration: none;
            padding: 12px 0 14px;
            border-radius: 10px;
            /*-webkit-font-smoothing: antialiased;*/

            background-color: #0f351e;
            color: #78d698;
        }

        .ctrls #stop {
            background-color: #3e1918;
            color: #ff3939;
        }

        .ctrls #reset {
            margin-left: 2%;
            background-color: #3e3d3e;
            color: #fff;
        }

        .ctrls #lap {
            margin-left: 2%;
            background-color: #3e3d3e;
            color: #fff;
        }

        .canvasContainer {
            width: 180px;
            height: 50px;
            margin: 0 auto;
            /*overflow: hidden;*/

            position: relative;
            clear: both;
            float: left;
        }

        canvas {
            margin: 0;
            margin-left: 7px;
            padding: 0;
            border: none;
            position: absolute;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
        }

        #avg_time {
            width: 55px;
            float: left;
            text-align: right;
            color: #ff990c;
            font-size: 20px;
            padding-top: 22px;
        }

        .lap_numbers_container {
            height: 20px;
            width: 185px;
            position: relative;
            overflow: hidden;
            clear: both;
            margin-bottom: 5px;
        }

        #lap_numbers {
            position: absolute;
            top: 0;
            left: 0;
        }

        #lap_numbers span {
            color: #fff;
            width: 20px;
            font-size: 14px;
            display: block;
            float: left;
            text-align: center;
            margin-left: 15px;
        }

        #lap_numbers span:first-child {
            margin-left: 0px;
        }
    </style>

</head>
<body>

<div class="container">
    <div class="frame">
        <div id="watch">
            <div class="blur-top"></div>
            <div class="face">
                <div class="row-1">
                    <div class="timer">
                        <span id="timer_min">00</span>
                        <span>:</span>
                        <span id="timer_sec">00</span>
                        <span>.</span>
                        <span id="timer_mil">00</span>
                    </div>
                    <div class="time">
                        <span id="time_mins">00</span>
                        <span>:</span>
                        <span id="time_hours">00</span>
                    </div>
                </div>
                <div class="row-2">
                    <div class="clock c c1">
                        <i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i>
                        <span class="inner-cover"></span>
                        <i></i><i></i><i></i>
                        <span class="outer-cover"></span>
                        <div class="ns ns1">
                            <b>05</b><b>10</b><b>15</b><b>20</b><b>25</b><b>30</b>
                        </div>
                        <span class="pin"></span>
                        <span class="hand"></span>
                    </div>
                    <div class="clock c c2">
                        <i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i>
                        <span class="inner-cover"></span>
                        <i></i><i></i><i></i><i></i><i></i><i></i>
                        <span class="outer-cover"></span>
                        <div class="ns ns2">
                            <b>15</b><b>30</b><b>45</b><b>60</b>
                        </div>
                        <span class="pin"></span>
                        <span class="hand"></span>
                    </div>
                    <div class="clock d c3">
                        <i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i>
                        <span class="inner-cover"></span>
                        <i></i><i></i><i></i><i></i><i></i>
                        <span class="outer-cover"></span>
                        <div class="ns ns3">
                            <b>1</b><b>2</b><b>3</b><b>4</b><b>5</b><b>6</b><b>7</b><b>8</b><b>9</b><b>0</b>
                        </div>
                        <span class="pin"></span>
                        <span class="hand"></span>
                    </div>
                </div>
                <div class="row row-3">
                    <div class="lap_timer">
                        <span id="lap_min">00</span>
                        <span>:</span>
                        <span id="lap_sec">00</span>
                        <span>.</span>
                        <span id="lap_mil">00</span>
                    </div>
                </div>
                <div class="canvasContainer">
                    <canvas id="graph" width="185" height="73"></canvas>
                </div>
                <div id="avg_time"></div>
                <div class="lap_numbers_container">
                    <div id="lap_numbers"></div>
                </div>
                <div class="ctrls">
                    <a href="#start" id="start">Start</a>
                    <a href="#stop" id="stop" class="hide">Stop</a>
                    <a href="#reset" id="reset" class="hide">Reset</a>
                    <a href="#lap" id="lap">Lap</a>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    window.requestAnimFrame = (function(callback) {
        return window.requestAnimationFrame || window.webkitRequestAnimationFrame || window.mozRequestAnimationFrame || window.oRequestAnimationFrame || window.msRequestAnimationFrame ||
            function(callback) {
                window.setTimeout(callback, 1000 / 60);
            };
    })();

    var graph = {
        'state': {
            'pause': false,
            'inUse': false,
            'lapNum': 1
        },
        'markerStyle': {
            'green': '#67d276',
            'red': '#f73748'
        },
        'coords': {
            'x': 5,
            'y': 50,
            'prev': {
                'x': 0,
                'y': 60
            }
        },
        'msc': {
            'fastestLap': 0,
            'slowestLap': 99999999,
            'startTime': 0
        }
    };

    //Global Watch Elements
    var lap_mil = document.getElementById('lap_mil'),
        lap_sec = document.getElementById('lap_sec'),
        lap_min = document.getElementById('lap_min'),
        timer_mil = document.getElementById('timer_mil'),
        timer_sec = document.getElementById('timer_sec'),
        timer_min = document.getElementById('timer_min'),
        watch = document.getElementById('watch'),
        avg_time = document.getElementById('avg_time');

    //Canvas Elements
    var canvas = document.getElementById('graph'),
        ctx = canvas.getContext('2d'),
        lap = document.getElementById('lap'),
        lap_numbers = document.getElementById('lap_numbers');

    //Other required Elements
    var clock,
        lapClock,
        interval,
        lapOffset,
        lapTotal,
        laps = [],
        breakLoop = 0;

    var reset = 0;

    var iWatch = function() {

        var startButton = addAction("start", start),
            stopButton = addAction("stop", stop),
            resetButton = addAction("reset", reset),
            lapButton = addAction("lap", lap);

        reset();

        function addAction(action, handler) {
            var a = document.getElementById(action);
            a.addEventListener("click", function(event) {
                handler();
                event.preventDefault();
            });
            return a;
        }

        function start() {
            if (!interval) {
                offset = Date.now();
                watch.classList.add('go');
                watch.classList.remove('pause');
                startButton.classList.add('hide');
                stopButton.classList.remove('hide');
                resetButton.classList.add('hide');
                lapButton.classList.remove('hide');
                interval = setInterval(update, 1);
                graph.state.pause = false;
                if (!graph.state.inUse) {
                    breakLoop = 0;
                    graph.animate(canvas, ctx, graph.msc.startTime);
                    graph.state.inUse = true;
                }
            }
        }

        function stop() {
            if (interval) {
                watch.classList.add('pause');
                startButton.classList.remove('hide');
                stopButton.classList.add('hide');
                resetButton.classList.remove('hide');
                lapButton.classList.add('hide');
                clearInterval(interval);
                interval = null;
                graph.state.pause = true;
            }
        }

        function reset() {
            clock = 0;
            lapClock = 0;
            lapOffset = 0;
            lapTotal = 0;
            watch.classList.remove('go');
            watch.classList.remove('pause');
            render();
            graph.resetGraph(ctx, canvas);
        }

        function lap() {
            //record lap time
            var temp = clock - lapTotal;

            lapTotal += temp;
            lapOffset = clock;
            var val = graph.recordLap(graph.coords);

            var current = {
                'time_ms': temp,
                'lap_number': val.lap_number,
                'x': graph.coords.prev.x,
                'y': graph.coords.prev.y
            }
            laps.push(current);
        }

        function update() {
            clock += delta();
            lapClock = clock - lapOffset;
            render();
        }

        function render() {
            var t_ms = (clock / 1000).toFixed(2),
                t_sec = parseInt(clock / 1000),
                t_min = parseInt(clock / 1000 / 60);

            if (t_sec > 59) {
                t_sec = t_sec - (60 * t_min);
            }

            timer_mil.innerHTML = (t_ms ? (t_ms > 9 ? t_ms : "0" + t_ms) : "00").slice(-2); // ms
            timer_sec.innerHTML = (t_sec ? (t_sec > 9 ? t_sec : "0" + t_sec) : "00"); // sec
            timer_min.innerHTML = (t_min ? (t_min > 9 ? t_min : "0" + t_min) : "00"); // min

            var l_ms = (lapClock / 1000).toFixed(2),
                l_sec = parseInt(lapClock / 1000),
                l_min = parseInt(lapClock / 1000 / 60);

            if (l_sec > 59) {
                l_sec = l_sec - (60 * l_min);
            }

            lap_mil.innerHTML = (l_ms ? (l_ms > 9 ? l_ms : "0" + l_ms) : "00").slice(-2); // ms
            lap_sec.innerHTML = (l_sec ? (l_sec > 9 ? l_sec : "0" + l_sec) : "00"); // sec
            lap_min.innerHTML = (l_min ? (l_min > 9 ? l_min : "0" + l_min) : "00"); // min
        }

        function delta() {
            var now = Date.now(),
                t = now - offset;
            offset = now;
            return t;
        }

        // public API
        this.start = start;
        this.stop = stop;
        this.reset = reset;
        this.lap = lap;
    };

    var clock = function() {
        var d = new Date(),
            time_hours = document.getElementById('time_hours'),
            time_mins = document.getElementById('time_mins');

        setInterval(function() {
            setTime();
        }, 1000);

        function setTime() {
            var hrs = d.getHours();
            var mins = d.getMinutes();
            time_hours.innerHTML = (hrs > 9 ? hrs : "0" + hrs);
            time_mins.innerHTML = (mins > 9 ? mins : "0" + mins);
        }
        setTime();
    }

    graph.animate = function(canvas, c, startTime) {

        if (breakLoop == 1) {
            breakLoop = 0;
            return;
        }

        if (!graph.state.pause) {
            var linearSpeed = 20;
            var newY = linearSpeed * (startTime += 10) / 1000;

            var offset = 0;
            if (laps.length > 5) {
                offset = (laps.length - 5) * 35;
            }

            if (newY < 50) {
                graph.coords.y = 50 - newY;
            }

            if (reset == 1) {
                //startTime = (new Date()).getTime();
                startTime = 0;
                reset = 0;
            }

            // Clear Canvas
            c.clearRect(0, 0, canvas.width, canvas.height);

            // Draw average
            if (graph.state.lapNum > 2) {

                var totalY = 0,
                    totalTime = 0;

                for (var key in laps) {
                    if (laps.hasOwnProperty(key)) {
                        var lap = laps[key];
                        totalY += lap.y;
                        totalTime += lap.time_ms;
                    }
                }

                var meanY = totalY / laps.length;
                var avgTime = totalTime / laps.length;

                // Write average time
                avgTime = Math.round(parseFloat(avgTime / 1000));
                avg_time.innerHTML = Math.round(parseFloat(avgTime)) + 's';

                // Draw mean line
                c.beginPath();
                c.setLineDash([2]);
                c.strokeStyle = '#ffac39';
                c.moveTo(0, meanY - 0.5);
                c.lineTo(canvas.width, meanY - 0.5);
                c.stroke();
                c.closePath();
            }

            // Draw Connect Line
            c.beginPath();
            c.strokeStyle = '#fff';
            c.setLineDash([0]);

            if (graph.state.lapNum !== 1) {
                c.moveTo(graph.coords.prev.x - offset, graph.coords.prev.y);
                c.lineTo(graph.coords.x - offset, graph.coords.y);
            }
            c.stroke();
            c.closePath();

            //Draw Previous Markers
            for (var key in laps) {
                if (laps.hasOwnProperty(key)) {
                    var lap = laps[key];
                    c.beginPath();
                    c.strokeStyle = '#fff';
                    c.fillStyle = '#fff';
                    c.arc(lap.x - offset, lap.y, 2.5, 0, 2 * Math.PI, false);
                    c.fill();
                    c.closePath();

                    //Draw lap lap number
                    c.beginPath();
                    ctx.font = '14px helvetica';
                    ctx.fillText(lap.lap_number, lap.x - offset - 5, canvas.height - 10);
                    c.closePath();

                    //Draw Previous Line
                    if (lap.lap_number > 1) {
                        c.beginPath();
                        c.strokeStyle = '#fff';
                        c.moveTo(laps[key - 1].x - offset, laps[key - 1].y);
                        c.lineTo(lap.x - offset, lap.y);
                        c.stroke();
                        c.closePath();
                    }
                }
            }

            //Draw Marker
            c.beginPath();
            if (graph.state.lapNum == 1) {
                c.fillStyle = '#fff';
                c.strokeStyle = '#fff';
            } else {
                if (graph.coords.y > graph.msc.fastestLap) {
                    c.fillStyle = graph.markerStyle.green;
                    c.strokeStyle = graph.markerStyle.green;
                } else if (graph.coords.y < graph.msc.slowestLap) {
                    c.fillStyle = graph.markerStyle.red;
                    c.strokeStyle = graph.markerStyle.red;
                } else {
                    c.fillStyle = '#fff';
                    c.strokeStyle = '#fff';
                }
            }
            c.arc(graph.coords.x - offset, graph.coords.y, 2.5, 0, 2 * Math.PI, false);
            c.fill();
            c.closePath();

        }

        requestAnimFrame(function() {
            graph.animate(canvas, c, startTime);
        });
    }

    graph.recordLap = function(c) {

        graph.coords.prev.x = c.x;
        graph.coords.prev.y = c.y;
        reset = 1;
        graph.coords.x += 35;

        if (graph.state.lapNum == 1) {
            graph.msc.fastestLap = c.y;
        } else {
            if (c.y > graph.msc.fastestLap) {
                graph.msc.fastestLap = c.y;
            } else if (c.y < graph.msc.slowestLap) {
                graph.msc.slowestLap = c.y;
            }
        }

        graph.state.lapNum++;

        return {
            'x': c.x,
            'y': c.y,
            'lap_number': graph.state.lapNum - 1
        };
    }

    graph.resetGraph = function(ctx, canvas) {
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        lap_numbers.innerHTML = '';
        avg_time.innerHTML = '';
        graph.state.inUse = false;
        //graph.state.pause = false;
        graph.state.lapNum = 1;
        graph.coords.x = 5;
        graph.coords.y = 50;
        graph.coords.prev.x = 0;
        graph.coords.prev.y = 50;
        graph.msc.fastestLap = 0;
        graph.msc.slowestLap = 99999999;
        graph.msc.startTime = 0;
        graph.state.lapNum = 1;
        reset = 1;
        laps = [];
        breakLoop = 1;
    }

    // Initiate
    clock();
    var iWatch = new iWatch();
</script>

</body>
</html>
