class BodyPart
{
    let carriesOxyg: Bool
    var otherTerm: String
    var amountInOneBody: Int
    
    init(bloodvessel: Bool, anotomy: String, amountInAPerson: Int)
    {
        self.carriesOxyg = true
        self.otherTerm = anotomy
        self.amountInOneBody = 20
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
    let carriesOxy: String
    var everyoneHasOne: Bool
    
    init(takesInOxy: Bool, redBloodCell: String, everyoneHasOne: Bool)
    {
      self.pumpsBlood = true
      self.carriesOxy = redBloodCell
      self.everyoneHasOne = true
    }
    func toBringOxytoBody()
    {
}

class Lung : BodyPart
{
    let developsInLateStageOfLife: Bool
    var helpsToBreath: String
    let twoSetsOfThem: Bool
    
    init(developsInLateStageOfLife: Bool, deepbreathIn: String, twoSetsOfThem: Bool)
    {
        self.developsInLateStageOfLife = false
        self.helpsToBreath = deepbreathIn
        self.twoSetsOfThem = true
    }
    func bringsOxgytoTheBody()
    {
    
}

class Skeleton : BodyPart
{
    let supportsTheBody: Bool
    var differentTypesOfBone: String
    var differentMovements: String
    
    init(supportsTheBody: Bool, short: String, rotation: String)
    {
        self.supportsTheBody = true
        self.differentTypesOfBone = short
        self.differentMovements = rotation
    }
    func fameWorkOfTheBody()
    {
}

class Skin : BodyPart
{
    let largestOrgOfTheBody: Bool
    var color: String
    var Otherfunctions: String
    
    init(largestOrgOfTheBody: Bool, brown: String, sweats: String)
    {
        self.largestOrgOfTheBody = true
        self.color = brown
        self.Otherfunctions = sweats
    }
    func coversAndProtectsTheBody()
    {
}

class Eyes : BodyPart
{
    var shapes: String
    var eyeColor: String
    let amountOnEachPerson: Int
    
    init(almond: String, brown: String, amountOnEachPerson: Int)
    {
        self.shapes = almond
        self.eyeColor = brown
        self.amountOnEachPerson = 2
    }
    func helpsToSee()
    {
}

class Liver : BodyPart
{
    let produceBile: Bool
    let stroesGlucose: Bool
    var haveItRemove: String
    
    init(produceBile: Bool, stroesGlucose: Bool, stillHaveIt: String)
    {
        self.produceBile = true
        self.stroesGlucose = true
        self.haveItRemove = stillHaveIt
    }
    func regulatesChemicalsInTheBody()
    {
}

class Mouth : BodyPart
{
    let amountOnTheFace: Int
    var sizeOnTheFace: String
    let helpsWithChewing: Bool
    
    init(amountOnTheFace: Int, justTheRightSize: String)
    {
        self.amountOnTheFace = 1
        self.sizeOnTheFace = justTheRightSize
        self.helpsWithChewing = true
    }
    func theBeginningOfDigestiveTrack()
    {
}

class Arm : BodyPart
{
    let onlyTwoPerPerson: Bool
    let helpsWithReaching: Bool
    var canDoOtherFunctions: String
    
    init(onlyTwoPerPerson: Bool, helpsWithReaching: Bool, clapping: String)
    {
        self.onlyTwoPerPerson = true
        self.helpsWithReaching = true
        self.canDoOtherFunctions = clapping
    }
    func helpsToReachObjects()
    {
}

class Brain : BodyPart
{
    let governsTheBody: Bool
    var keepsTheBalance: String
    let storesInformation: Bool
    
    init(governsTheBody: Bool, cerebellum: String)
    {
        self.governsTheBody = true
        self.keepsTheBalance = cerebellum
        self.storesInformation = true
    }
    func mainControlCenterOfTheBody()
    {
}

class Eyebrow : BodyPart
{
    
    let locatedAboveTheEye: Bool
    var differentColor: String
    let madeOfHair: Bool
    
    init(locatedAboveTheEye: Bool, black: String, madeOfHair: Bool)
    {
        self.locatedAboveTheEye = true
        self.differentColor = black
        self.madeOfHair = true
    }
    func keepsSweatFromStingingTheEyes()
    {
}

class Nose : BodyPart
{
    let primaryOrgOfSmell: Bool
    var canSmellDifferentSmells: String
    let partOfTheRespitorySystem: Bool
    
    init(primaryOrgOfSmell: Bool, somethingThatIsNotPlesant: String)
    {
        self.primaryOrgOfSmell = true
        self.canSmellDifferentSmells = somethingThatIsNotPlesant
        self.partOfTheRespitorySystem = true
    }
    func senseOfSmell()
    {
}


class Stomach : BodyPart
{
    var partsOfTheDigestiveSystem: Bool
    let theAmountWithinHumanBody: Int
    let mainFoodStorageTank: Bool
    
    init(partsOfTheDigestiveSystem: Bool, theAmountWithinHumanBody: Int)
    {
        self.partsOfTheDigestiveSystem = true
        self.theAmountWithinHumanBody = 1
        self.mainFoodStorageTank = true
        
    }
    func digestsFood()
    {
    
}

class Bladder : BodyPart
{
    var changeSizes: String
    let storesUrine: Bool
    let recievesUrineFromKindney: Bool
    
    init(whenEmpty: String, storesUrine: Bool, recievesUrineFromKindney: Bool)
    {
        self.changeSizes = whenEmpty
        self.storesUrine = true
        self.recievesUrineFromKindney = true
    }
    func holdsUrine()
    {
}

class Ears : BodyPart
{
    var hearinglose: String
    var produceSound: String
    var canBeSensitive: String
    
    init(whenItIsDamage: String, whenItIsFunProperly: String, withThoseWhoHaveAutism: String)
    {
        self.hearinglose = whenItIsDamage
        self.produceSound = whenItIsFunProperly
        self.canBeSensitive = withThoseWhoHaveAutism
    }
    func toHearSounds()
    {
}

class Tongue : BodyPart
{
    let isAMuscularOrg: Bool
    var affectsSpeech: String
    var helpsWithChewing: String
    
    init(isAMuscularOrg: Bool, tongetie: String, likeTeeth: String)
    {
        self.isAMuscularOrg = true
        self.affectsSpeech = tongetie
        self.helpsWithChewing = likeTeeth
    }
    func senseOfTaste()
    {
}

class Gallbladder : BodyPart
{
    let locatesOnTheRightSideOfAbdomen: Bool
    let itIsPartOfTheDigestiveSystem: Bool
    var itCanDevelopGallStones: String
    
    init(locatesOnTheRightSideOfAbdomen: Bool, itIsPartOfTheDigestiveSystem: Bool, whenThereIsExcessOfcholesterol: String)
    {
        self.locatesOnTheRightSideOfAbdomen = true
        self.itIsPartOfTheDigestiveSystem = false
        self.itCanDevelopGallStones = whenThereIsExcessOfcholesterol
        
    }
    func storeAndConcentrateBile()
    {
}

class Lymph : BodyPart
{
    let actingAsFilterForCancerCells: Bool
    var becomesEnlarged: String
    var amountOfLymphNodesInTheBody: Int
    
    init(actingAsFilterForCancerCells: Bool, whenInflamed: String, amountOfLymphNodesInTheBody: Int)
    {
        self.actingAsFilterForCancerCells = true
        self.becomesEnlarged = whenInflamed
        self.amountOfLymphNodesInTheBody = 500
    }
    func defeatAgainstHarmfulDebris()
    {
}


class Kidney : BodyPart
{
    var canFunctionWithJustOne: Bool
    var sizeOfAfist: Bool
    let aPairOfOrgans: Bool
    
    init(canFunctionWithJustOne: Bool, sizeOfAfist: Bool, aPairOfOrgans: Bool)
    {
        self.canFunctionWithJustOne = true
        self.sizeOfAfist = true
        self.aPairOfOrgans = true
    }
}

class Gut : BodyPart
{
    var partOfTheDigestive: String
    var sizeOfSmallIntestine: Int
    var possibleDiseases: String
    
    init(smallIntestine: String, sizeOfSmallIntestine: Int, UlcerativeColitis: String)
    {
        self.partOfTheDigestive = smallIntestine
        self.sizeOfSmallIntestine = 5
        self.possibleDiseases = UlcerativeColitis
    }
    func obsorbsNutrients()
    {
}
