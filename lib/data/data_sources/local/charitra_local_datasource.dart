import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:varadvani/domain/entities/appa/charitra_episode_entity.dart';

final charitraLocalDataSourceProvider = Provider<CharitraLocalDataSource>(
  (ref) => CharitraLocalDataSourceImpl(),
);

abstract class CharitraLocalDataSource {
  List<CharitraEpisodeEntity> getEpisodes();
}

class CharitraLocalDataSourceImpl implements CharitraLocalDataSource {
  @override
  List<CharitraEpisodeEntity> getEpisodes() => const [
    CharitraEpisodeEntity(
      title: 'प्रारंभिक निवेदन व चरित्र आढावा',
      duration: '24:49',
      videoUrl: 'https://www.youtube.com/watch?v=2ZCnAA-iZpc',
    ),
    CharitraEpisodeEntity(
      title: 'पूर्व पिठीका / जन्म / गोदार्पण सोहळा / बालपण / ब्रह्मचर्याश्रम',
      duration: '22:01',
      videoUrl: 'https://www.youtube.com/watch?v=O8G9sstRux4',
    ),
    CharitraEpisodeEntity(
      title: 'कीर्तनाचा ओनामा',
      duration: '15:42',
      videoUrl: 'https://www.youtube.com/watch?v=pynwBM3ihQg&t=1s',
    ),
    CharitraEpisodeEntity(
      title: 'अनुग्रह व आयुर्वेद महाविद्यालय, पुणे',
      duration: '08:38',
      videoUrl: 'https://www.youtube.com/watch?v=iNWC8Pr1n8Q',
    ),
    CharitraEpisodeEntity(
      title: 'स्वतःचे परीक्षण “मी”',
      duration: '14:22',
      videoUrl: 'https://www.youtube.com/watch?v=b62yMYSN9DA',
    ),
    CharitraEpisodeEntity(
      title: 'गृहस्थाश्रमारंभ / मुंबईचे कीर्तन',
      duration: '09:50',
      videoUrl: 'https://www.youtube.com/watch?v=gg_sWEu1qmM',
    ),
    CharitraEpisodeEntity(
      title:
          'श्री न. चिं. केळकर / श्री दिनकर (मामा) देशपांडे / श्रीकृष्णकथामृत लेखन',
      duration: '11:26',
      videoUrl: 'https://www.youtube.com/watch?v=G2C0CS0mni8',
    ),
    CharitraEpisodeEntity(
      title: 'छात्रबोध',
      duration: '13:02',
      videoUrl: 'https://www.youtube.com/watch?v=HAH5odWSHOs',
    ),
    CharitraEpisodeEntity(
      title:
          'श्रीदासगणू महाराज चरित्र लिखाण व प्रकाशन / गोरट्याला पांडुरंग व शनिदेव स्थापना',
      duration: '12:15',
      videoUrl: 'https://www.youtube.com/watch?v=eJ_eRpLqmgI',
    ),
    CharitraEpisodeEntity(
      title: 'नोकरीचे त्यागपत्र / ती.दादांचे निर्याण',
      duration: '11:08',
      videoUrl: 'https://www.youtube.com/watch?v=Qiqjg_MJDY8',
    ),
    CharitraEpisodeEntity(
      title: 'श्रीसोनुमामा दांडेकर / समाधी मंदिराचे भूमिपूजन / योगतारावली',
      duration: '09:54',
      videoUrl: 'https://www.youtube.com/watch?v=tXbEJpfdzks',
    ),
    CharitraEpisodeEntity(
      title: 'श्रीनारायण दर्शनाची ओढ',
      duration: '08:00',
      videoUrl: 'https://www.youtube.com/watch?v=yS63Z5gQWNU',
    ),
    CharitraEpisodeEntity(
      title: 'सतोपथ यात्रा',
      duration: '12:23',
      videoUrl: 'https://www.youtube.com/watch?v=HJ8BT8olG9E',
    ),
    CharitraEpisodeEntity(
      title: 'श्रीराजेश्वरशास्त्री द्रविड / अनुवाद ज्ञानेश्वरी लिखाण',
      duration: '15:09',
      videoUrl: 'https://www.youtube.com/watch?v=8G3XwhwmDAE',
    ),
    CharitraEpisodeEntity(
      title: 'दक्षिण भारत प्रवास / महाभारताचे वास्तव दर्शन',
      duration: '08:04',
      videoUrl: 'https://www.youtube.com/watch?v=zDaPlOz4q8Y',
    ),
    CharitraEpisodeEntity(
      title: 'श्रीवरदनारायण दर्शन',
      duration: '20:41',
      videoUrl: 'https://www.youtube.com/watch?v=OfW6UseNrNU',
    ),
    CharitraEpisodeEntity(
      title: 'नांदेड ते पंढरपूर पदयात्रा',
      duration: '06:29',
      videoUrl: 'https://www.youtube.com/watch?v=od_JBaZFGW4',
    ),
    CharitraEpisodeEntity(
      title: 'श्री वा. ना. उत्पात / साधकोपदेश',
      duration: '15:37',
      videoUrl: 'https://www.youtube.com/watch?v=EFvbw67j7mM',
    ),
    CharitraEpisodeEntity(
      title: 'अनुग्रहितांना मार्गदर्शन / वाटा आपल्या हिताच्या',
      duration: '16:38',
      videoUrl: 'https://www.youtube.com/watch?v=2_7ueHWA-Ic',
    ),
    CharitraEpisodeEntity(
      title: 'मनोबोध / उत्सवांचे धोरण व प्रयोजन',
      duration: '10:07',
      videoUrl: 'https://www.youtube.com/watch?v=jra9hGWXVlA',
    ),
    CharitraEpisodeEntity(
      title: 'श्रीधुंडामहाराज / सिंधु स्नान',
      duration: '10:52',
      videoUrl: 'https://www.youtube.com/watch?v=1kMVegyjqRw',
    ),
    CharitraEpisodeEntity(
      title: 'ब्रम्हसूत्रभाष्य लिखाण / बदरीनाथ प्रसंग',
      duration: '14:36',
      videoUrl: 'https://www.youtube.com/watch?v=UPw-CMv8dRA',
    ),
    CharitraEpisodeEntity(
      title: 'वानप्रस्थाश्रमाकडे',
      duration: '09:19',
      videoUrl: 'https://www.youtube.com/watch?v=GcxXsJt-YJ4',
    ),
    CharitraEpisodeEntity(
      title: 'कैलास-मानस यात्रा',
      duration: '19:56',
      videoUrl: 'https://www.youtube.com/watch?v=iEjO8gwLK9Q',
    ),
    CharitraEpisodeEntity(
      title:
          'गंगोत्री / मॅजेस्टिक प्रकाशन आयोजित गच्चीवरील गप्पा / श्रीविष्णुसहस्रनाम सार्थ',
      duration: '05:57',
      videoUrl: 'https://www.youtube.com/watch?v=TvorZgpdtVY',
    ),
    CharitraEpisodeEntity(
      title: 'उपनिषद लेखन / शृंगेरी',
      duration: '06:17',
      videoUrl: 'https://www.youtube.com/watch?v=7AN_d3rRchw',
    ),
    CharitraEpisodeEntity(
      title: 'पुन्हा एकदा सिंधु स्नान / देगलूर',
      duration: '04:58',
      videoUrl: 'https://www.youtube.com/watch?v=R3kj8SfetIo',
    ),
    CharitraEpisodeEntity(
      title: 'अनुबोध पटाची निर्मिती',
      duration: '08:38',
      videoUrl: 'https://www.youtube.com/watch?v=9mg7JKeP-eM',
    ),
    CharitraEpisodeEntity(
      title: 'श्री दासगणू महाराज – महाराष्ट्र शासन निर्मित अनुबोधपट',
      duration: '17:41',
      videoUrl: 'https://www.youtube.com/watch?v=ZeTXoy6wv0w',
    ),
    CharitraEpisodeEntity(
      title: 'आळंदीच्या वैदिकांची गोरटे भेट / श्री.शंकर अभ्यंकर',
      duration: '07:48',
      videoUrl: 'https://www.youtube.com/watch?v=_YmM6MXEviA',
    ),
    CharitraEpisodeEntity(
      title: 'अधिक मासातील प्रसंग / पू. अप्पांचा श्रद्धा भाव',
      duration: '05:01',
      videoUrl: 'https://www.youtube.com/watch?v=2-vSExSTXi0',
    ),
    CharitraEpisodeEntity(
      title: 'उपनिषद भाष्य',
      duration: '06:18',
      videoUrl: 'https://www.youtube.com/watch?v=lZA8oGYOxkA',
    ),
    CharitraEpisodeEntity(
      title: 'वसुमती तथा गार्गी ताई यांची गुरुसेवा',
      duration: '06:55',
      videoUrl: 'https://www.youtube.com/watch?v=TePsPpNyDQc',
    ),
    CharitraEpisodeEntity(
      title: 'विद्यावाचस्पती परांजपे व प.पू.आप्पांचा पुत्रोपदेश',
      duration: '06:12',
      videoUrl: 'https://www.youtube.com/watch?v=zxC4ysuBUAo',
    ),
    CharitraEpisodeEntity(
      title: 'प.पू.आप्पांची मानस भक्ती आणि परशुराम कुंड दर्शन',
      duration: '08:50',
      videoUrl: 'https://www.youtube.com/watch?v=9OVPGcuIDkk',
    ),
    CharitraEpisodeEntity(
      title: 'प.पू.आप्पांचे मानस सरोवराला पत्र व त्याचा प्रसाद',
      duration: '07:34',
      videoUrl: 'https://www.youtube.com/watch?v=mVaPYHJSobI',
    ),
    CharitraEpisodeEntity(
      title: 'प.पू.आप्पांची कीर्तन सेवा व संन्यासाश्रम',
      duration: '14:16',
      videoUrl: 'https://www.youtube.com/watch?v=km_s5O8EBHs',
    ),
    CharitraEpisodeEntity(
      title: 'राजकीय मार्गदर्शन व मातोश्रींचे निधन',
      duration: '07:45',
      videoUrl: 'https://www.youtube.com/watch?v=t20qKPzhfkM',
    ),
    CharitraEpisodeEntity(
      title: 'प.पू.आप्पांचे श्री वरदनारायण चित्र रेखाटन',
      duration: '20:58',
      videoUrl: 'https://www.youtube.com/watch?v=la1OpIk6YTc',
    ),
    CharitraEpisodeEntity(
      title: 'बासरी ताईंचे गायन आणि नरु भाऊंचे मनोगत',
      duration: '12:10',
      videoUrl: 'https://www.youtube.com/watch?v=GjQWjoNAoUA',
    ),
    CharitraEpisodeEntity(
      title: 'प.पू.आप्पांचा संन्यासाश्रम दिक्षाविधी',
      duration: '18:33',
      videoUrl: 'https://www.youtube.com/watch?v=s9ad8bDhD8E',
    ),
    CharitraEpisodeEntity(
      title: 'स्वामी उमानंदगिरी यांचे मनोगत',
      duration: '07:41',
      videoUrl: 'https://www.youtube.com/watch?v=UmiCH22BfDs',
    ),
    CharitraEpisodeEntity(
      title: 'पूर्वरंग तरंग व तरंगिणी पुस्तकांचे लेखन',
      duration: '05:25',
      videoUrl: 'https://www.youtube.com/watch?v=9mBJ-XSlld4',
    ),
    CharitraEpisodeEntity(
      title: 'संन्यस्थ अप्पांचे स्वागत, गुरुमंत्र, अजापाजप',
      duration: '08:11',
      videoUrl: 'https://www.youtube.com/watch?v=yDZfULgBLgQ',
    ),
    CharitraEpisodeEntity(
      title: 'तपोवन यात्रा आणि श्री नारायणाचे सगुण दर्शन',
      duration: '19:30',
      videoUrl: 'https://www.youtube.com/watch?v=fdrn3PGrw0Y',
    ),
    CharitraEpisodeEntity(
      title: 'प.पू.अप्पांचा पंच्याहत्तरीतही प्रवासातील उत्साह',
      duration: '14:05',
      videoUrl: 'https://www.youtube.com/watch?v=vBaWJSU4_7g',
    ),
    CharitraEpisodeEntity(
      title: 'भावार्चना प्रकाशन, शास्त्रीजी शताब्दी महोत्सव',
      duration: '12:57',
      videoUrl: 'https://www.youtube.com/watch?v=0ztzgTIpu28',
    ),
    CharitraEpisodeEntity(
      title: 'प.पू.अप्पांचे वाङ्मय विवेचन व पारमार्थिक उपदेश',
      duration: '13:17',
      videoUrl: 'https://www.youtube.com/watch?v=O_EOVQZuSrc',
    ),
    CharitraEpisodeEntity(
      title: 'नंदनवन व व्यासकुंड मोहीम, साधना मार्गदर्शन',
      duration: '08:37',
      videoUrl: 'https://www.youtube.com/watch?v=wYR-ejDtltU',
    ),
    CharitraEpisodeEntity(
      title: 'प.पू.अप्पांचे षहत्तरीनिमित्त मनोगत, खंत व निवेदन',
      duration: '20:49',
      videoUrl: 'https://www.youtube.com/watch?v=T2AuVLOkcoY',
    ),
    CharitraEpisodeEntity(
      title: 'प.पू.अप्पांचे नित्योपयोगी, साधना ग्रंथ मार्गदर्शन',
      duration: '08:45',
      videoUrl: 'https://www.youtube.com/watch?v=9ICTjHEpYks',
    ),
    CharitraEpisodeEntity(
      title: 'प.पू.अप्पांची आकाशवाणी प्रसारित प्रत्यक्ष मुलाखत',
      duration: '40:34',
      videoUrl: 'https://www.youtube.com/watch?v=PldMyTM101o',
    ),
    CharitraEpisodeEntity(
      title: 'आप्पाची कल्पकता व पूर्वीचे विनावकील न्यायासन',
      duration: '08:08',
      videoUrl: 'https://www.youtube.com/watch?v=9tBMRuC7yk8',
    ),
    CharitraEpisodeEntity(
      title: 'पांडुरंगशास्त्रींशी भेट व डॉ. असनानींची श्रद्धा',
      duration: '11:26',
      videoUrl: 'https://www.youtube.com/watch?v=20z78jcX4OE',
    ),
    CharitraEpisodeEntity(
      title: 'जीवेत: शरद: अनंतम, मनुस्मृति व आमनायाची रचना',
      duration: '11:15',
      videoUrl: 'https://www.youtube.com/watch?v=CryTB5klMIw',
    ),
    CharitraEpisodeEntity(
      title: 'मनुस्मृतिचे प्रकाशन व आप्पांचा गोरट्यास निरोप',
      duration: '12:46',
      videoUrl: 'https://www.youtube.com/watch?v=_W-t2uSZZgA',
    ),
    CharitraEpisodeEntity(
      title: 'आप्पांचे कारगिल गीत, सिंधू स्नान, गंगानमन',
      duration: '10:55',
      videoUrl: 'https://www.youtube.com/watch?v=l8JQJ1xMhmQ',
    ),
    CharitraEpisodeEntity(
      title: 'वरदनारायणाचा संकेत व आप्पांच्या मनाची घालमेल',
      duration: '15:32',
      videoUrl: 'https://www.youtube.com/watch?v=wn1UxQKL5dk',
    ),
    CharitraEpisodeEntity(
      title: 'मानसपूजा, साधना, शेवटची गोकुळाष्टमी, वेध वैकुंठाचे',
      duration: '07:37',
      videoUrl: 'https://www.youtube.com/watch?v=v7pMyDtjPFM',
    ),
    CharitraEpisodeEntity(
      title: 'आम्ही जातो आमुच्या गावा आमचा रामराम घ्यावा…',
      duration: '25:47',
      videoUrl: 'https://www.youtube.com/watch?v=cx17ZLHr7AQ',
    ),
  ];
}
