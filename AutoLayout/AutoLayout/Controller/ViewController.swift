
import UIKit

class ViewController: UIViewController {
    
    // MARK: Variable
    var backgroundImg = ["Banner1", "Banner2"]
    
    var timer: Timer?
    var currentCellIndex = 0
    var numOfItem = 2
    var pageControlNums = 0
    
    //MARK: OUTLET
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnSuscribeNow: UIButton!
    @IBOutlet weak var viewFreeTrail: UIView!{
        didSet {
            viewFreeTrail.ApplyCorner(CornerRadius: 15.0, BorderWidth: 0.0, BorderColor: .clear)
        }
    }
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var pageControlCollectionView: UIPageControl! {
        didSet {
            self.pageControlCollectionView.numberOfPages = backgroundImg.count
            self.pageControlCollectionView.currentPage = 0
        }
    }
    
    //MARK: WEEK Subscribe VIEW Outlet
    @IBOutlet weak var imgWeekSubscribeButton: UIImageView!
    @IBOutlet weak var btnWeekSubcribe: UIButton!
    @IBOutlet weak var lblWeekSubscribe: UILabel! {
        didSet {
            lblWeekSubscribe.ApplyShadow(ShadowRadius: 0.1, ShadowOpacity: 1.0, ShadowOffset: CGSize(width: 2, height: 2), ShadowColor: .black)
        }
    }
    @IBOutlet weak var viewWeekSubscribeSabeView: UIView! {
        didSet {
            viewWeekSubscribeSabeView.ApplyCorner(CornerRadius: 15.0, BorderWidth: 0.0, BorderColor: .clear)
            viewWeekSubscribeSabeView.backgroundColor = UIColor(red: 0.855, green: 0.804, blue: 1.000, alpha: 1.0)
        }
    }
    @IBOutlet weak var viewWeekSubscribe: UIView!{
        didSet {
            viewWeekSubscribe.ApplyCorner(CornerRadius: 20.0, BorderWidth: 2.5, BorderColor: UIColor(red: 0.408, green: 0.145, blue: 0.949, alpha: 1.0))
        }
    }
    
    //MARK: YEAR Subscribe VIEW Outlet
    @IBOutlet weak var imgeYearSubscribeButton: UIImageView!
    @IBOutlet weak var btnYearSubscribe: UIButton!
    @IBOutlet weak var lblYearSubscribe: UILabel! {
        didSet {
            lblYearSubscribe.ApplyShadow(ShadowRadius: 2, ShadowOpacity: 1, ShadowOffset: CGSize.zero, ShadowColor: .black)
        }
    }
    @IBOutlet weak var viewYearSubscribeSabeView: UIView!{
        didSet {
            viewYearSubscribeSabeView.ApplyCorner(CornerRadius: 15.0, BorderWidth: 0.0, BorderColor: .clear)
            viewYearSubscribeSabeView.backgroundColor = UIColor(red: 0.831, green: 0.831, blue: 0.831, alpha: 1.0)
        }
    }
    @IBOutlet weak var viewYaerSubscribe: UIView!{
        didSet {
            viewYaerSubscribe.ApplyCorner(CornerRadius: 20.0, BorderWidth: 2.5, BorderColor: UIColor(red: 0.831, green: 0.831, blue: 0.831, alpha: 1.0))
        }
    }
    
    //MARK: COLLECTION VIEW OUTLET
    @IBOutlet weak var backgroundCollectionView: UICollectionView! {
        didSet {
            backgroundCollectionView.dataSource = self
            backgroundCollectionView.delegate = self
            
            let flowlayout = UICollectionViewFlowLayout.init()
            flowlayout.scrollDirection = .horizontal
            self.backgroundCollectionView.setCollectionViewLayout(flowlayout, animated: true)
            
            let backgroundCellNib = UINib(nibName: "BackroundCollectionViewCell", bundle: nil)
            self.backgroundCollectionView.register(backgroundCellNib, forCellWithReuseIdentifier: "BackroundCollectionViewCell")
        }
    }
    
    //MARK: CONTIUE BUTTON OUTLET
    @IBOutlet weak var bntContinue: UIButton!
    @IBOutlet weak var viewContinue: UIView! {
        didSet {
            viewContinue.ApplyCorner(CornerRadius: 15, BorderWidth: 0.0, BorderColor: .clear)
            viewContinue.ApplyShadow(ShadowRadius: 1, ShadowOpacity: 1.0, ShadowOffset: CGSize(width: 2, height: 2), ShadowColor: .black)
        }
    }
    
    //MARK: CONSTANT OUTLET
    @IBOutlet weak var constaintStackSubscribe: NSLayoutConstraint!
    @IBOutlet weak var stackViewSubscribe: UIStackView!
    @IBOutlet weak var constaintSubscribeToADFree: NSLayoutConstraint!
    
    //MARK: VIEW DID LOAD ()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(imgChangeTimer), userInfo: nil, repeats: true)
        
        if view.frame.size.height < 750 {
            constaintSubscribeToADFree.constant = 20
            constaintStackSubscribe.constant = 140
            stackViewSubscribe.spacing = 15
        }
        pageControlCollectionView.addTarget(self, action: #selector(pageControlTapped), for: .valueChanged)
        btnWeekSubcribe.addTarget(self, action: #selector(btnSubscribeTapped(_:)), for: .touchUpInside)
        btnYearSubscribe.addTarget(self, action: #selector(btnSubscribeTapped(_:)), for: .touchUpInside)
        btnCancel.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        
        
        backgroundCollectionView.isPagingEnabled = false
    }
    
    //MARK: OBJC FUNCTION
    @objc func cancelButtonTapped () {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func imgChangeTimer () {
        if currentCellIndex < backgroundImg.count-1 {
            currentCellIndex += 1
        } else {
            currentCellIndex = 0
        }
        
        pageControlCollectionView.currentPage = currentCellIndex
        backgroundCollectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .right, animated: true)
    }

    
    @objc func pageControlTapped(sender: UIPageControl) {
        let page = sender.currentPage
        let indexPath = IndexPath(item: page, section: 0)
        backgroundCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    @objc func btnSubscribeTapped(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            viewWeekSubscribe.ApplyCorner(CornerRadius: 20.0, BorderWidth: 3, BorderColor: UIColor(red: 0.408, green: 0.145, blue: 0.949, alpha: 1.0))
            imgWeekSubscribeButton.image = UIImage(named: "activeButton")
            viewYaerSubscribe.ApplyCorner(CornerRadius: 20.0, BorderWidth: 3, BorderColor: UIColor(red: 0.831, green: 0.831, blue: 0.831, alpha: 1.0))
            imgeYearSubscribeButton.image = UIImage(named: "inactiveButton")
            viewWeekSubscribeSabeView.backgroundColor = UIColor(red: 0.855, green: 0.804, blue: 1.000, alpha: 1.0)
            viewYearSubscribeSabeView.backgroundColor = UIColor(red: 0.831, green: 0.831, blue: 0.831, alpha: 1.0)
            lblWeekSubscribe.ApplyShadow(ShadowRadius: 0.1, ShadowOpacity: 1.0, ShadowOffset: CGSize(width: 2, height: 2), ShadowColor: .black)
            lblYearSubscribe.ApplyShadow(ShadowRadius: 2, ShadowOpacity: 1, ShadowOffset: CGSize.zero, ShadowColor: .black)
            //viewFreeTrail.isHidden = false
            
        case 2:
            viewYaerSubscribe.ApplyCorner(CornerRadius: 20.0, BorderWidth: 3, BorderColor: UIColor(red: 0.408, green: 0.145, blue: 0.949, alpha: 1.0))
            imgeYearSubscribeButton.image = UIImage(named: "activeButton")
            viewWeekSubscribe.ApplyCorner(CornerRadius: 20.0, BorderWidth: 3, BorderColor: UIColor(red: 0.831, green: 0.831, blue: 0.831, alpha: 1.0))
            imgWeekSubscribeButton.image = UIImage(named: "inactiveButton")
            viewWeekSubscribeSabeView.backgroundColor = UIColor(red: 0.831, green: 0.831, blue: 0.831, alpha: 1.0)
            viewYearSubscribeSabeView.backgroundColor = UIColor(red: 0.855, green: 0.804, blue: 1.000, alpha: 1.0)
            lblWeekSubscribe.ApplyShadow(ShadowRadius: 2, ShadowOpacity: 1, ShadowOffset: CGSize.zero, ShadowColor: .black)
            lblYearSubscribe.ApplyShadow(ShadowRadius: 0.1, ShadowOpacity: 1.0, ShadowOffset: CGSize(width: 2, height: 2), ShadowColor: .black)
            //viewFreeTrail.isHidden = true
            
        default:
            return
            
        }
    }
}

//MARK: EXTENSION
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return backgroundImg.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BackroundCollectionViewCell", for: indexPath) as! BackroundCollectionViewCell
        cell.imgBackground.image = UIImage(named: backgroundImg[indexPath.row])
        print(indexPath.row)
        
        //self.pageControlCollectionView.currentPage = indexPath.row
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    /*func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
            if indexPath.row == backgroundImg.count - 1 {
                print(indexPath.row)
                // Scrolled to the last item, append the first item to the end
                let firstItem = backgroundImg.remove(at: 0)
                backgroundImg.append(firstItem)
                collectionView.performBatchUpdates({
                    collectionView.deleteItems(at: [IndexPath(item: 0, section: 0)])
                    collectionView.insertItems(at: [IndexPath(item: backgroundImg.count - 1, section: 0)])
                }, completion: nil)
            }
        }*/
    
        
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: backgroundCollectionView.frame.width, height: mainView.frame.height)
    }
}
