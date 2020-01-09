//
//  ViewController.swift
//  Lesson4_DZ
//
//  Created by Andrian Kryk on 26.12.2019.
//  Copyright © 2019 Andrian Kryk. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    //Внимание! Все задания делать отдельными методами!!!
    
    
    //        I. Прочесть главу "Strings and Characters" - swift book.ru
    //        Задача 1. Создать строку с своим именем, вывести количество символов содержащихся в ней.
    
    countCharacters(in: "LoremIpsum")
    delineator()
    
    //        Задача 2. Создать строку с своим отчеством проверить его на окончание “ич/на”
    //        P.S. в классе написан метод который позволяет проверить на суффикс или префикс, найдите и используйте его.
    
    findEndig(in: "Ivanovich")
    delineator()
    
    //        Задача 3. Cоздать строку, где слитно написано Ваши ИмяФамилия “IvanVasilevich"
    //        Вам нужно разбить на две отдельных строки из предыдущей создать третью, где они обе будут разделены пробелом
    //        str1 = “Ivan”
    //        str2 = “Vasilevich”
    //        str3 = “Ivan Vasilevich"
    
    splitName("AndrianIvanovich")
    delineator()
    
    //        Задача 4. Вывести строку зеркально Ось → ьсО не используя reverse (посимвольно)
    
    reverse(word: "Ось")
    delineator()
    
    //        Задача 5. Добавить запятые в строку как их расставляет калькулятор
    //        1234567 → 1,234,567
    //        12345 → 12,345
    //        (не использовать встроенный метод для применения формата)
    
    addComas(in: "12312312341241241")
    delineator()
    
    //        Задача 6. Проверить пароль на надежность от 1 до 5
    //        a) если пароль содержит числа +1
    //        b) символы верхнего регистра +1
    //        c) символы нижнего регистра +1
    //        d) спец символы +1
    //        e) если содержит все вышесказанное
    //        Пример:
    //        123456 - 1 a)
    //        qwertyui - 1 c)
    //        12345qwerty - 2 a) c)
    //        32556reWDr - 3 a) b) c)
    
    checkPasswordSecurity(of: "asdK$3")
    delineator()
    
    
    //        II. Прочесть главу "Collection Types" - swift book.ru
    //        Задача 7. Сортировка массива не встроенным методом по возрастанию + удалить дубликаты
    //        [9, 1, 2, 5, 1, 7]
    
    arraySorting()
    delineator()
    
    //
    //        Задача 8. Написать метод, который будет переводить строку в транслит.
    //        Пример:
    //        print(convertStrToTranslite:”ЯЗЗЬ”) → “YAZZ”
    //        print(convertStrToTranslite:”морДа”) → “morDa”
    
    translit(this: "ЯЗЬ И МОРДА")
    delineator()
    
    //        Задача 9. Сделать выборку из массива строк в которых содержится указанная строка
    //        [“lada”, “sedan”, “baklazhan”] search “da”
    //        → [“lada”, “sedan”] - sort() && sort using NSPredicate + manual (for loop)
    
    print(findText(in: ["lada", "sedan", "baklazhan"], searchString: "an"))
    delineator()
    
    //        Задача 10. Set<String> - antimat [“fuck”, “fak”] “hello my fak” “hello my ***”
    //        использовать Set или NSSet для программы antimat - исключить из предложения все слова содержащиеся в сете
    
    
  }
  
  func delineator() {
    print("*************************")
  }
  
  func countCharacters(in str: String) {
    print("\"\(str)\" consist of \(str.count) characters")
  }
  
  func findEndig(in patronymic: String) {
    if patronymic.contains("ich"){
      print("\"\(patronymic)\" contains \"ich\" ending")
    } else {
      print("\"\(patronymic)\" doesn't contains \"ich\" ending")
    }
  }
  
  func splitName(_ str: String) {
    var newStrArray = [String] ()
    
    for character in str {
      if String(character) == String(character).uppercased() {
        newStrArray.append(" ")
      }
      newStrArray.append(String(character))
    }
    
    var newStr: String = newStrArray.joined(separator: "")
    newStr.remove(at: newStr.startIndex)
    print(newStr)
    
  }
  
  func reverse(word str: String) {
    var newString = ""
    for i in str {
      newString = "\(i)" + newString
    }
    print(str,"->",newString)
  }
  
  func addComas(in str: String) {
    var result = ""
    
    for (index, element) in str.reversed().enumerated() {
      result.insert(element, at: result.startIndex)
      
      if((index + 1) % 3 == 0 && index != str.count - 1) {
        result.insert(",", at: result.startIndex)
      }
    }
    print(result)
  }
  
  func checkPasswordSecurity(of str: String) {
    var securityLevel = 0
    
    if str.rangeOfCharacter(from: .decimalDigits) != nil {
      securityLevel += 1
    }
    if str.rangeOfCharacter(from: .uppercaseLetters) != nil {
      securityLevel += 1
    }
    if str.rangeOfCharacter(from: .lowercaseLetters) != nil {
      securityLevel += 1
    }
    if str.rangeOfCharacter(from: .symbols) != nil {
      securityLevel += 1
    }else if str.rangeOfCharacter(from: .punctuationCharacters) != nil{
      securityLevel += 1
    }
    if securityLevel == 4 {
      securityLevel += 1
    }
    
    print("Password security - \(securityLevel) points")
  }
  
  func arraySorting() {
    var arrayNumbers = [Int]()
    
    for _ in 0..<10 {
      arrayNumbers.append(Int.random(in: 0...10))
    }
    print("Random array of 10 numbers - \(arrayNumbers)")
    
    for _ in 0..<arrayNumbers.count {
      for j in 1..<arrayNumbers.count {
        if arrayNumbers[j]<arrayNumbers[j-1] {
          let tempItemVar = arrayNumbers[j-1]
          arrayNumbers[j-1] = arrayNumbers[j]
          arrayNumbers[j] = tempItemVar
        }
      }
    }
    print("Sorted array - \(arrayNumbers)")
    
    var tempArray = [Int]()
    
    for i in 1..<arrayNumbers.count {
      if arrayNumbers[i] != arrayNumbers [i-1] {
        tempArray.append(arrayNumbers[i])
      }
    }
    tempArray.insert(arrayNumbers[0], at: 0)
    arrayNumbers = tempArray
    print("Without doubles - \(arrayNumbers)")
  }
  
  func translit(this phraze: String) {
    let dict: [String: String] = ["А":"A",
                                  "Б":"B",
                                  "В":"V",
                                  "Г":"G",
                                  "Д":"D",
                                  "Е":"E",
                                  "Ё":"JO",
                                  "Ж":"ZH",
                                  "З":"Z",
                                  "И":"I",
                                  "Й":"Y",
                                  "К":"K",
                                  "Л":"L",
                                  "М":"M",
                                  "Н":"N",
                                  "О":"O",
                                  "П":"P",
                                  "Р":"R",
                                  "С":"S",
                                  "Т":"T",
                                  "У":"U",
                                  "Ф":"F",
                                  "Х":"H",
                                  "Ц":"C",
                                  "Ч":"CH",
                                  "Ш":"SH",
                                  "Щ":"SCH",
                                  "Ъ":"'",
                                  "Ы":"Y",
                                  "Ь":"'",
                                  "Э":"E",
                                  "Ю":"YU",
                                  "Я":"YA",]
    let inputMessage = phraze
    var outputMessage = ""
    
    for i in inputMessage {
      let character = "\(i)"
      
      if let encodedChar = dict[character] {
        outputMessage += encodedChar
      }else {
        outputMessage += character
      }
    }
    print(outputMessage)
  }
  
  func findText(in arrayOf:[String], searchString:String ) -> [String] {
    let text = arrayOf
    let filterArray = text.filter({ $0.range(of: searchString/*, options: .caseInsensitive*/) != nil})
    return filterArray
  }
  
  
}
