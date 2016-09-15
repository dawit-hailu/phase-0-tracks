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
mycar = new car('orange',1931, 'ford', 'T' );
console.log(mycar.color +" "+ mycar.year +" "+ mycar.brand)