//HomeWork 1.3
//Properties. Methods. Management in PLO

//Task 1
//Возьмите любой пример из жизни (класс) и опишите уровни доступа к нему. Постарайтесь описать как публичные,, так и закрытые уровни и методы. Для решения задачи можно взять класс из предыдущего домашнего задания.

/*
class Car {
    var brand: String = ""
    var model: String = ""
    private var numberEngine: String = ""
    var body: String = ""
    var power : Double = 0
    
    func powerUp() {
        self.power = self.power * 1.3
    }
    
    init(brand:String, model: String, power: Double) {
        self.brand = brand
        self.model = model
        self.power = power
    }
}

var audi = Car(brand: "Audi", model: "A3", power: 125)
audi.powerUp()
print(audi.power)

*/
print("Task#1\n")
class Car {
    var brand: String = ""
    var model: String = ""
    var body: String = ""
    
    func fuelConsumption(engine: Double, transmission: Bool) -> Double {  //transmission - МКПП/АКПП
        var fC: Double = 10.0
        switch engine {
        case 1.5...1.9: do {
            if transmission {
                fC = 7.0
            } else {
                fC = 8.0
            }
            }
        case 2.0...2.5: do {
            if transmission {
                fC = 10.0
            } else {
                fC = 12.0
            }
            }
        default:
            fC = 10.0
        }
        
        return fC
    }
    
    func powerUp(power: Double) -> Double { //Chip tuning
        var chip = power
        switch chip {
        case 100...125:
            chip = chip*1.3
            
        case 126...150:
            chip = chip*1.2
        case 151...:
            chip = chip*1.1
        default:
            chip
        }
        
        return chip
    }
    
    init(brand:String, model: String, body: String) {
           self.brand = brand
           self.model = model
           self.body = body
       }
}

class Audi: Car {
    private let brandName: String = "«Vorsprung durch Technik» («Прогресс через технологии»)"
    
    //ауди лучше чипуются))
    
    override func powerUp(power: Double) -> Double {
        var chip = power
        switch chip {
        case 100...125:
            chip = chip*1.35
            
        case 126...150:
            chip = chip*1.25
        case 151...:
            chip = chip*1.18
        default:
            chip
        }
        
        return chip
    }
    
    fileprivate func production() {
        print("Никто не узнает, что Audi лучше всех\n")
    }
    //можно бы еще было переопределить метод расхода, что  он в теории после чипа тоже повыситься
    
}

class Volkswagen: Car {
    private let brandName: String = "«Volkswagen» («Это автомобиль»)"
    
    
}


var audiA3 = Audi(brand: "Audi", model: "A3", body: "седан")
print("Поздравляем, вы купили \(audiA3.brand)\(audiA3.model)\n")
print("Ваш расход топлива будет - \(audiA3.fuelConsumption(engine: 1.6, transmission: false)) л/100км")
print("Вы успешно чипанули свою машину до мощности - \(audiA3.powerUp(power: 125)) л.с")
audiA3.production()


//Если я что-то забыл или неправильно описал, то могу исправить. Проблемы с фантазией - они такие. Лучше работать по некому ТЗ
//Хочется в некоторых местах использовать перечисления, но не особо понимаю где и как их можно применять

//Task #2
//Создайте класс. Создайте 3 метода с одинаковым названием, но разными сигнатурами. Статический анализатор Swift подскажет вам, если overload не получится ;)
print("\nTask#2\n")
class Purse {
    func rubles(amount: Int) {
        print("You have \(amount) rubles")
    }
    func rubles() {
        print("I dont know why he created me. Help pls.")
    }
    func rubles(name: String) {
        print("You have some \(name)")
    }
}

var myPurse = Purse()

myPurse.rubles()
myPurse.rubles(amount: Int.random(in: 0...10000))
myPurse.rubles(name: "money")


//Task #3
//Создайте класс-родитель. Определите в нем метод. Создайте класс-наследник. Переопределите в нем метод родителя, но с вызовом родительского метода.

//Было обсуждение у меня с Алексеем Бардиным по поводу домашней работы "Основы ООП" и там обсуждался интересный пример
/*
 Пакет (для переноски товаров) некий абстрактрый (общий) класса -> наследник Целлофановый пакет имеет теже свойства что и родитель, только имеет другой материал свою прочность и прочие характеристики - Пакет “Маечка” еще один пример наследника, но уже целлофанового пакета, также содрежит свойства всех выше перечисленных пакетов, но имеет например пониженную прочность и т.п.

 Например на тех же пакетах полиморфизм: вы можем переносить в этих пакетах все что угодно - картофель, детсвкую игрушку, автомобильное колесо.
 */
//Поэтому думаю здесь можно реализовать данный пример
print("\nTask#3\n")
class Package {
    //var maxLoad: Int = 0
    var color: String = "Black"
    func transferThings(maxload: Double) {
        print("Ты набрал \(maxload) кг и пытаешься это все положить в меня?")
    }

}

class PlasticBag: Package {
    
    override func transferThings(maxload: Double) {
        super.transferThings(maxload: maxload)
        if maxload > 1 {
            print("Пакет скорее всего порвется")
        } else {
            print("Ты донесешь этот пакет")
        }
    }

}

var standartPackage = Package()
standartPackage.transferThings(maxload: (Double.random(in: 0...10 * 100).rounded() ) / 100 )
print()
var noColorPlasticPackage = PlasticBag()
noColorPlasticPackage.transferThings(maxload: (Double.random(in: 0...2 * 100).rounded() ) / 100 )
