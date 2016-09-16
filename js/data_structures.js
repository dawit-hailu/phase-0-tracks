var colors = ['blue','grean','red', 'orange'];
var horses = ['sparkle', 'billy', 'lacy', 'jack'];
colors.push('black');
horses.push('blondy');

function car(color,year,brand,model) {
	this.color = color;
	this.year = year;
	this.brand = brand;
	this.model = model;
}
var cars = [];
cars.push(new car('orange',1931, 'ford', 'T' ));
cars.push(new car('red',2001, 'ford', 'escape' ));
cars.push(new car('green',2015, 'toyota', 'corola' ));
cars.push(new car('silver',2014, 'tesla', 'Model S' ));


for (var i=0; i < cars.length; i++) {
	console.log(cars[i].color +" "+ cars[i].year +" "+ cars[i].brand +" "+ cars[i].model)
}