import 'package:flutter/material.dart';
import 'package:qfx/components/colors.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  State<TermsAndConditionsScreen> createState() =>
      _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.scaffoldDarkBack,
        title: const Text('Terms & Conditions'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Terms and Conditions: QFX Cinemas',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15.0),
            // Inserted Terms and Conditions
            // _buildSectionTitle('General Terms and Conditions'),
            _buildBulletPoint(
                'The user accepts and agrees to be bound by the Terms and Conditions when accessing and using the Mobile Application, Website and the services provided by QFX Cinemas.'),
            _buildBulletPoint(
                'The information provided by the customers shall be correct and accurate.'),
            _buildBulletPoint(
                'Tickets and food once purchased cannot be cancelled, exchanged or refunded.'),
            _buildBulletPoint(
                'Tickets purchased for particular cinema theatres are valid for that particular location only.'),
            _buildBulletPoint(
                'Customers must be 18 years and above to sign up and purchase ticket through QFX APP and website. If customers are between 15 to 18 years, they may sign up and purchase tickets through QFX App and Website only with the involvement, supervision, and approval of a parent or legal guardian.'),
            _buildBulletPoint(
                'Customers under 15 years must be accompanied by an adult to purchase tickets and watch movies.'),
            _buildBulletPoint(
                'Children below the age of 16 years cannot be admitted for movies rated \'A\' or unless otherwise mentioned in the movie Censor Certificate. Customers need to carry ID specifying age for movies rated \'A\'.'),
            _buildBulletPoint(
                'Separate ticket is required for all admissions (including children). Infants are not allowed in the theatres.'),
            _buildBulletPoint(
                'Any transactions made from third party payment vendor is subjected to standard and specified terms and conditions mentioned by that particular vendor.'),
            _buildBulletPoint(
                'The 3D glasses will be available at the cinema for 3D films and must be returned before you exit the premises.'),
            _buildBulletPoint(
                'In case of loss or damage of 3D Glasses, customers are chargeable as per individual cinema policies.'),
            _buildBulletPoint(
                'Outside food and beverages are not allowed inside the cinema premises.'),
            _buildBulletPoint(
                'Customer under influence of alcohol or visibly intoxicated might not get admission or will be requested to leave the QFX premises.'),
            _buildBulletPoint(
                'Anyone who is Loud, boisterous, disorderly, argumentative, annoying other patrons and staff, physically violent, aggressive, using offensive language, exhibiting inappropriate behavior and vomiting will be not be allowed permission inside QFX theaters or will be asked to leave immediately.'),
            _buildBulletPoint(
                'Entry is allowed only for valid ticket holders.'),
            _buildBulletPoint(
                'In case a ticket is lost or misplaced, a duplicate ticket will be issued only if the customer is aware of their show time and the seats number.'),
            _buildBulletPoint(
                'QFX Cinemas’ management is not responsible for the theft or loss of personal belongings.'),
            _buildBulletPoint(
                'Unauthorized filming of movies using a camera, mobile phones, tablets, etc. is strictly prohibited inside the QFX Cinemas theatres and such acts may be punishable offense.'),
            _buildBulletPoint(
                'In case of reservations, ticket get deactivated an hour prior to the show, customers need to collect their tickets an hour prior to the show from the Box Office.'),
            _buildBulletPoint(
                'To collect your reserved tickets from the QFX Cinemas Box Office, it is mandatory to present the Personal QR Code of the user to make the user confirmation.'),
            _buildBulletPoint(
                'Agreeing to Terms and Conditions during Sign In, Sign Up or Ticket Purchase confirms your acceptance of all cookies available in the QFX App and Website.'),
            _buildBulletPoint(
                'QFX shall not be liable for any incident caused of act of God, insurrection or civil disorder, war or military operations, national or local emergency, compliance of any kind including fire, lighting, explosion, flood, subsistence, weather of exceptional severity or any event outside of its reasonable control.'),
            _buildBulletPoint(
                'Decision(s) taken by QFX Cinemas shall be final and binding.'),
            _buildBulletPoint('Rights of admission reserved.'),
            _buildBulletPoint(
                'Ticket holders are required to abide by the policies laid down by QFX Cinemas Management.'),

            const SizedBox(height: 20.0),
            // _buildSectionTitle('Child Policy'),
            _buildBulletPoint(
                'Everyone (all individuals) requires their own separate ticket.'),
            _buildBulletPoint(
                'Infants under 1 year (or visibly lap child) will strictly not be allowed in the theater. This is also due to health issues they might encounter.'),
            _buildBulletPoint(
                'Children must sit in their purchased seat throughout the movie.'),
            _buildBulletPoint(
                'Children 12 years and younger must be accompanied by an adult for all U or PG movies.'),
            _buildBulletPoint(
                'An individual must be 16+ years with valid ID to see an A-rated movie. No children under 16 years will be admitted to any A-rated film.'),
            _buildBulletPoint(
                'Children disturbing other theater audience during movie screening will be asked to immediately leave the theatre along with their parents or guardians. No ticket refund will be given.'),

            const SizedBox(height: 20.0),
            // _buildSectionTitle('Terms and Conditions: Club QFX Loyalty Program'),
            _buildBulletPoint(
                'Club QFX is a free loyalty program embedded in QFX App/Website. Customers can register using their mobile number and email address.'),
            _buildBulletPoint(
                'Customers must be at least 18 years of age to participate in the program. If customers are between 15 to 18 years, they may enroll in the Club QFX loyalty program only with the involvement, supervision, and approval of a parent or legal guardian.'),
            _buildBulletPoint(
                'By registering with Club QFX program, registered customers shall be deemed to have read, understood and accepted all applicable Terms and Conditions set here forth.'),
            _buildBulletPoint(
                'QFX management may amend its Terms and Conditions as required. Such amendments shall be carried out at the sole discretion of QFX. Registered customers will be notified prior to any ratification of amended Terms and Conditions through the QFX App.'),
            _buildBulletPoint(
                'QFX loyalty program will allow the use of certain technologies, software and/or services of QFX such that registered customers can use its Application through their mobile devices and/or use its official website.'),
            _buildBulletPoint(
                'QFX grants registered customers a non-transferable, non-exclusive, revocable authorization to access and use loyalty Offers and loyalty software platform.'),
            _buildBulletPoint(
                'Registered customers agree to the condition that they are the sole responsible party for all consequences arising from the submission of inaccurate, incomplete and/or insufficient information during the registration process.'),
            _buildBulletPoint(
                'Registered customers shall be held solely responsible for maintaining all passwords and access codes to the QFX App, and are required to refrain from sharing or otherwise permitting third parties to use their passwords and/or access codes to access the Loyalty Program'),

            _buildBulletPoint(
                'Registration will continue uninterrupted unless either party (QFX or registered customer) provide a notice of termination to the other. After end of the notice period, registration shall be terminated and concerned customer will no longer be entitled to access or use the loyalty points.'),
            _buildBulletPoint(
                'For purposes of clarity, registered customers can terminate their QFX loyalty account at any time. Upon termination concerned customer will no longer be entitled to access or use any of the loyalty points.'),
            _buildBulletPoint(
                'QFX is the sole owner of the name "Club QFX" as well as the Application, the Website, and all source code, object code, software, content, copyrights, trademarks, patents and other intellectual property related thereto or included therein. All suggestions, recommendations, bug-fixes, error-fixes or other communication from registered customers to upgrade loyalty program regarding the Application or the Website shall, upon submission to QFX, be owned solely and exclusively by QFX.'),

            const SizedBox(height: 20.0),
            // _buildSectionTitle('Points Accumulation'),
            _buildBulletPoint(
                'Registered customers can accumulate points by using the loyalty program through QFX App. After each purchase customers can provide their registered mobile number with the help of customer service representatives and earn point for each rupee spent.'),
            _buildBulletPoint(
                'Customers can track their activities and accumulated points by visiting their account page on the QFX App or website under loyalty.'),
            _buildBulletPoint(
                'Points do not have any cash value. They cannot be transferred or redeemed for cash. Points in a customer’s account will be annulled upon termination of registration, howsoever caused.'),

            const SizedBox(height: 20.0),
            // _buildSectionTitle('QFX Loyalty points'),
            _buildBulletPoint(
                'QFX Loyalty points are the in-App currency and can be redeemed for offers from any and all QFX Cinemas theaters.'),
            _buildBulletPoint(
                'Customers can gather loyalty points by purchasing movie tickets and F&B items at QFX cinema theaters.'),
            _buildBulletPoint('One loyalty point is equivalent to one Rupee.'),
            _buildBulletPoint(
                'Loyalty points are not redeemable for cash and are not transferable.'),
            _buildBulletPoint(
                'Customers are eligible to accumulate certain percentage of amount spent as points as per their tier levels.'),
            _buildBulletPoint(
                'In case of previous or continued QFX users, the email accounts that match in Goji will have their Goji Coins automatically transferred to Club QFX loyalty program.'),

            const SizedBox(height: 20.0),
            // _buildSectionTitle('Redemption of QFX loyalty Points'),
            _buildBulletPoint(
                'QFX loyalty points redemption shall be governed by QFX’s Terms and Conditions.'),
            _buildBulletPoint(
                'Customers can claim Loyalty points as equivalent cash discount on their purchase.'),
            _buildBulletPoint(
                'Any and all disputes arising from or relating to goods and services received/claimed using in-App transaction shall be settled between the customer and QFX Cinemas.'),
            _buildBulletPoint(
                'After redemption, points may not be exchanged for cash and/or points or other offers.'),

            const SizedBox(height: 20.0),
            const Text(
              'For more information, please contact support@qfxcinemas.com',
              style: TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle, color: Colors.green),
          const SizedBox(width: 10.0),
          Flexible(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}

class _buildSectionTitle {
  _buildSectionTitle(Comparable<String> s);
}
