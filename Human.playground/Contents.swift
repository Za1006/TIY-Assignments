class BodyPart
{
    let carriesOxyg: Bool
    var otherTerm: String
    var amountInOneBody: Int
    
    init(bloodvessel: Bool, anotomy: String, amountInAPerson: Int)
    {
        self.carriesOxyg = true
        self.otherTerm = anotomy
        self.amountInOneBody = 1
    }
    func governByTheBrain()
    {
    
}

class Leg : BodyPart
{
    let belowTorsol: Bool
    let hasApaulse: Bool
    let amountOntheBody: Int
    
    init(belowTorsol: Bool, hasAPaulse: Bool, amountOntheBody: Int)
    {
        self.belowTorsol = true
        self.hasApaulse = true
        self.amountOntheBody = 2
    }
    func toBeMobile()
    {
}


class Heart : BodyPart
{
    let pumpsBlood: Bool
    let carriesOxy: Bool
    var everyoneHasOne: Bool
    
    init(takesInOxy: Bool, pumpBool: Bool, everyoneHasOne: Bool)
    {
      self.pumpsBlood = true
      self.carriesOxy = true
      self.everyoneHasOne = true
    }
    func toBringOxytoBody()
    {
}

class Lung : BodyPart
{
    
}

class Skeleton : BodyPart
{

}

class Skin : BodyPart
{
    
}

class Eyes : BodyPart
{
    
}

class Liver : BodyPart
{
    
}

class Mouth : BodyPart
{
    
}

class Arm : BodyPart
{
    
}

class Brain : BodyPart
{
    
}

class Eyebrow : BodyPart
{
    
}

class Nose : BodyPart
{
    
}

class Eyelids : BodyPart
{
    
}

class Stomach : BodyPart
{
    
}

