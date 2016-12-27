function onMouseMove(event) {
	if(event.layerY < 100) {
		mouse.x = event.layerX;
		mouse.y = event.layerY;
	}
}

function initialization2() {
	if(initialize == imagesneed) {
		then = Date.now();
		requestAnimationFrame(main);
	}
}

function main() {
	var now = Date.now();
	//游戏数据更新
	update(now - then);
	//游戏绘图操作
	render();
	then = now;
	requestAnimationFrame(main);
}

function update(time) {
	info.sizechangetime += time;
	if(info.sizechangetime > 500) {
		canvas.attr("width", $("html").width());
		canvas.attr("height", $("html").height());
	}
	animation.movetime += time;
	while(animation.movetime > 20) {
		animation.x += Math.round((mouse.x - animation.x) / 30 * 100) / 100;
		animation.y += Math.round((mouse.y - animation.y) / 30 * 100) / 100;
		animation.movetime -= 20;
	}
	animation.changetime += time;
	while(animation.changetime > 200) {
		if(animation.change) {
			animation.imgindex--;
			if(animation.imgindex == 1) {
				animation.change = false;
			}
		}
		else {
			animation.imgindex++;
			if(animation.imgindex == 3) {
				animation.change = true;
				var index = water.safe++;
				water[index] = new Object();
				var speed = Math.random() - 0.5;
				water[index].x = animation.x - 20 + speed * 80;
				water[index].y = animation.y + 10;
				water[index].xspeed = speed * 5;
				water[index].yspeed = 0;
				water[index].img = "water";
				water[index].movetime = 0;
			}
		}
		animation.img = "an" + animation.imgindex;
		animation.changetime -= 200;
	}
	for(i in water) {
		water[i].movetime += time;
		while(water[i].movetime > 20) {
			water[i].x += water[i].xspeed;
			water[i].y += water[i].yspeed;
			water[i].yspeed += 0.1;
			water[i].movetime -= 20;
		}
		if(water[i].y > canvas.height()) {
			delete water[i];
		}
	}
}

function render() {
	ctx.setTransform(scale, 0, 0, scale, 0, 0);
	ctx.clearRect(0, 0, canvas.width(), canvas.height());
	ctx.drawImage(images[animation.img], animation.x - 100, animation.y - 100);
	for(i in water) {
		if(i != "safe") {
			ctx.setTransform(scale, 0, 0, scale, 0, 0);
			ctx.drawImage(images[water[i].img], water[i].x, water[i].y);
		}
	}
}
var canvas = $("#animation");
//监听鼠标移动事件
canvas[0].addEventListener('mousemove', onMouseMove, false);
//全局缩放比
scale = 1;
ctx = canvas[0].getContext("2d");
//鼠标位置
mouse = new Object();
mouse.x = 100;
mouse.y = 100;
//全局信息
info = new Object();
info.sizechangetime = Date.now();
//云朵
animation = new Object();
animation.x = -100;
animation.y = -100;
animation.movetime = 0;
animation.change = false;
animation.changetime = 0;
animation.img = "an1";
animation.imgindex = 1;
//水滴
water = new Object();
water.safe = 0;
//已加载图片个数
initialize = 0;
//需要加载图片个数+1
imagesneed = 1;
//初始化容器
images = new Object();
//------------------------------------
name = "an1";
images[name] = new Image();
imagesneed++;
images[name].onload = function() {
	initialize++;
	initialization2();
}
images[name].src = "img/an1.png";
//--------------------------------------
name = "an2";
images[name] = new Image();
imagesneed++;
images[name].onload = function() {
	initialize++;
	initialization2();
}
images[name].src = "img/an2.png";
//--------------------------------------
name = "an3";
images[name] = new Image();
imagesneed++;
images[name].onload = function() {
	initialize++;
	initialization2();
}
images[name].src = "img/an3.png";
//--------------------------------------
name = "water";
images[name] = new Image();
imagesneed++;
images[name].onload = function() {
	initialize++;
	initialization2();
}
images[name].src = "img/water.png";
//--------------------------------------
initialize++;
initialization2();