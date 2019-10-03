public with sharing class Rectangle {

    public Decimal width;
    public Decimal height;

    public Rectangle(Decimal w, Decimal h) {
        if (w <= 0 || h <= 0) {
            System.debug('Invalid rectangle sides. The sides are set to default values equal 1');
            this.width = 1;
            this.height = 1;
        }
        else {
            this.width = w;
            this.height = h;
        }
    }

    public Decimal perimeter() {
        return 2 * (this.width + this.height);
    }

    public Decimal area() {
        return this.width * this.height;
    }

    public void stretch(Decimal wscale, Decimal hscale) {
        if (wscale <= 0 || hscale <= 0) {
            System.debug('Invalid scale value');
        }
        else {
            this.width *= wscale;
            this.height *= hscale;
        }
    }
}

/*
 * for (Integer i = 0; i < 9; i++) {
    Rectangle rect = new Rectangle(i, i*2);
    System.debug('Rectangle: ' 
                 + rect.width + ' ' 
                 + rect.height + ' ' 
                 + rect.perimeter() + ' ' 
                 + rect.area());
}

Rectangle rect = new Rectangle(10, 20);
rect.stretch(2.0, 2);
System.debug('Rectangle: ' 
                 + rect.width + ' ' 
                 + rect.height + ' ' 
                 + rect.perimeter() + ' ' 
                 + rect.area());
*/