import 'package:farmy_blog/models/blog_post.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dummyDataProvider = Provider<List<BlogPost>>((ref) {
  return dummyData;
});

List<BlogPost> dummyData = [
  const BlogPost(
    id: 1,
    title: "The Crypto Industry Is Helping Trump Pick SEC Chair",
    description:
        " The president-elect's transition team is consulting with industry leaders as it vets potential replacements for outgoing chair Gary Gensler, sources tell WIRED.",
    content:
        "In July, at a bitcoin conference in Nashville, Tennessee, Trump pledged to fire Gensler if reelected, drawing perhaps the most raucous applause of the night. I will appoint an SEC chair who will buil….",
    urlToImage:
        "https://media.wired.com/photos/6745db10e149b18ca8e2b8d8/191:100/w_1280,c_limit/GettyImages-93181618.jpg",
    comments: [
      Comment(
        id: 1,
        content: 'Great post!',
        replies: [
          Comment(
            id: 2,
            content: 'Thanks!',
            replies: [],
          ),
        ],
      ),
    ],
  ),
  const BlogPost(
    id: 2,
    title:
        "Bitcoin ATM Security Breach Compromised Social Security Numbers and Government IDs",
    description:
        "Byte Federal operates 1,200 Bitcoin ATMs in the U.S. A data breach comprised 58,000 customer's information.",
    content:
        "A massive data breach hit Bitcoin ATM company Byte Federal, compromising user information including their social security number, transaction history, and even photographs. If youve done business wit…",
    urlToImage: "https://gizmodo.com/app/uploads/2024/12/BitcoinATM.jpg",
    comments: [
      Comment(
        id: 1,
        content: 'Great post!',
        replies: [
          Comment(
            id: 2,
            content: 'Thanks!',
            replies: [],
          ),
        ],
      ),
    ],
  ),
  const BlogPost(
    id: 3,
    title: "Bitcoin buyer sues council over £600m 'lost in tip'",
    description:
        "James Howells believes the hard drive is now worth about £600m since the recent Bitcoin surge.",
    content:
        "James Howells addressed the press outside court on Tuesday\r\nA man trying to recover a Bitcoin hard drive in a landfill site which he says is now worth about £600m is \"seeking to bribe the council\", i…",
    urlToImage:
        "https://ichef.bbci.co.uk/news/1024/branded_news/1307/live/3ed38ef0-b18a-11ef-9049-eda50882c74d.jpg",
    comments: [
      Comment(
        id: 1,
        content: 'Great post!',
        replies: [
          Comment(
            id: 2,
            content: 'Thanks!',
            replies: [],
          ),
        ],
      ),
    ],
  ),
  const BlogPost(
    id: 4,
    title:
        "Laptop That Helped Bring Down Bitcoin Thief ‘Razzlekhan’ Is Now in the Smithsonian",
    description:
        "The museum's monetary collection has struggled with how to display cryptocurrency, but a federal agent's laptop is helping to shape our understanding of the future of money.",
    content:
        "The National Numismatic Collection at the Smithsonian Museum is a catalog of money. It houses gold bars, 600,000 Confederate banknotes, and gold coins from the 14th century. Now it also houses a MacB…",
    urlToImage: "https://gizmodo.com/app/uploads/2024/11/Razzlekahn.jpg",
    comments: [
      Comment(
        id: 1,
        content: 'Great post!',
        replies: [
          Comment(
            id: 2,
            content: 'Thanks!',
            replies: [],
          ),
        ],
      ),
    ],
  ),
  const BlogPost(
    id: 5,
    title:
        "A man hid 5 boxes across the US with more than \$2 million worth of treasure inside",
    description:
        "An early bitcoin investor concealed the chests, which include bitcoin, antiques, and an emerald, and published a book with clues to find them.",
    content:
        "Jon Collins-Black, a musician and early bitcoin investor, went on a five-year-long quest to bury treasure across the US.Jon Collins-Black\r\n\u003Cul\u003E\u003Cli\u003EJon Collins-Black has hidden five treasure chests ac…",
    urlToImage:
        "https://i.insider.com/673659c5fa0140cdd5638eeb?width=1024&format=jpeg",
    comments: [
      Comment(
        id: 1,
        content: 'Fascinating story!',
        replies: [Comment(id: 2, content: 'Totally agree!', replies: [])],
      ),
    ],
  ),
  const BlogPost(
    id: 6,
    title: "Who or what else did President Biden pardon? Find out in the quiz!",
    description:
        "Also in your grab bag of weekly trivia: martial law, bitcoin, the first lady's holiday décor, a Kennedy who's not RFK Jr., brain rot and the popemobile.",
    content:
        "In a refreshing change of pace, the presidents of the U.S. and South Korea dominated the news this week. Are pardons and martial law the shape of things to come? No comment!\r\nPlus, dark chocolate is …",
    urlToImage:
        "https://npr.brightspotcdn.com/dims3/default/strip/false/crop/11308x6361+0+2/resize/1400/quality/100/format/jpeg/?url=http%3A%2F%2Fnpr-brightspot.s3.amazonaws.com%2F53%2F41%2Fd7dc88204978a7b99f4cd16d8366%2Fbiden-pope-biden.jpg",
    comments: [
      Comment(
        id: 1,
        content: 'Interesting read!',
        replies: [Comment(id: 2, content: 'Indeed!', replies: [])],
      ),
    ],
  ),
  const BlogPost(
    id: 7,
    title:
        "Trump's SEC pick and Bitcoin's \$100K milestone are two big wins for the crypto community",
    description:
        "Trump nominated Paul Atkins, who has been a member of the Token Alliance since 2017, to SEC chair. Bitcoin surpassed \$100,000 for the first time.",
    content:
        "Joshua Roberts/Reuters; Chelsea Jia Feng/BI\r\n\u003Cul\u003E\u003Cli\u003EThis is an excerpt from the Insider Today newsletter.\u003C/li\u003E\u003Cli\u003EYou can sign up for Business Insider's daily newsletter here.\u003C/li\u003E\u003C/ul\u003EThe crypto co…",
    urlToImage:
        "https://i.insider.com/6751928a8fb3f94e507377d7?width=1200&format=jpeg",
    comments: [
      Comment(
        id: 1,
        content: 'Big news for crypto!',
        replies: [Comment(id: 2, content: 'Absolutely!', replies: [])],
      ),
    ],
  ),
  const BlogPost(
    id: 8,
    title:
        "Bitcoin Miner Purchases 112-Megawatt Texas Wind Farm, Takes it Off the Grid",
    description:
        "This week a Florida-based Bitcoin-tech company named MARA Holdings announced it had bought a 114-megawatt Texas wind farm, reports Chron.com, \"and will subsequently take it off the power grid and use it to energize its mining operations.\"",
    content:
        "This week a Florida-based Bitcoin-tech company named MARA Holdings announced it had bought a 114-megawatt Texas wind farm, reports Chron.com, \"and will subsequently take it off the power grid and use…",
    urlToImage: "https://a.fsdn.com/sd/topics/usa_64.png",
    comments: [
      Comment(
        id: 1,
        content: 'Innovative move!',
        replies: [Comment(id: 2, content: 'Totally agree!', replies: [])],
      ),
    ],
  ),
  const BlogPost(
    id: 9,
    title:
        "Pantera's Morehead Sees Bitcoin Soaring to \$740K Amid Policy Shifts and Skeptic Sentiment",
    description:
        "Dan Morehead predicts Bitcoin could hit \$740,000, driven by policy shifts and Pantera's growing blockchain investments.",
    content:
        "According to Dan Morehead, managing partner and founding member of Pantera Capital Management, Bitcoin's (BTC) explosive climb still has a lot of room to grow.\r\nMorehead dismissed worries of a Bitcoi…",
    urlToImage:
        "https://media.zenfs.com/en/us.finance.gurufocus/51250b22ee473ad261f1e16bd769d06b",
    comments: [
      Comment(
        id: 1,
        content: 'Exciting times ahead!',
        replies: [
          Comment(id: 2, content: 'Can’t wait to see this!', replies: [])
        ],
      ),
    ],
  ),
];
