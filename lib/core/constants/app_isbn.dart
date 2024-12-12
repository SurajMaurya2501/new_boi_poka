class AppIsbn {
  static const List<String> isbnList = [
    "9780261102439",
    "9789358567021",
    "9789354401473",
    "9789359047218",
    "9780062273208",

    //Home Page Books ISBN
    "0048232300",
    "0261103598",
    "9780547951973",
    "9780345538376",
    "0618260250",
    "0345339681",
    "9780007252268",
    "9780345466457",
  ];

  static const List<Map<String, dynamic>> isbnData = [
    {
      "isbn": "9780261102439",
      "data": {
        "book": "The Lord of the Rings",
        "authors": ["John Ronald Reuel Tolkien"],
        "popularity_country": {
          "United States": 30,
          "United Kingdom": 25,
          "Germany": 15,
          "France": 10,
          "Australia": 5,
          "Canada": 5,
          "New Zealand": 5,
          "India": 3,
          "Japan": 2
        },
        "book_read_mood": {
          "joy": 25,
          "melancholic": 15,
          "tense": 20,
          "hopeful": 20,
          "dark": 10,
          "romantic": 5,
          "nostalgic": 5,
          "humorous": 3,
          "adventurous": 30,
          "mystical": 20
        },
        "genres": ["Fantasy", "Adventure", "Epic"],
        "themes": [
          "Friendship",
          "Good vs Evil",
          "Sacrifice",
          "Courage",
          "Hope"
        ],
        "sentiment": {"positive": 60, "neutral": 30, "negative": 10},
        "expert_reviews": [
          {
            "name": "John Doe",
            "text": "A masterful blend of mythology and adventure.",
            "rating": 5
          },
          {
            "name": "Jane Smith",
            "text": "An unforgettable journey through Middle-earth.",
            "rating": 4.5
          },
          {
            "name": "Robert Brown",
            "text": "Tolkien's world-building is unparalleled.",
            "rating": 5
          },
          {
            "name": "Emily White",
            "text": "A bit lengthy, but worth every page.",
            "rating": 4
          },
          {
            "name": "Michael Green",
            "text": "A classic that stands the test of time.",
            "rating": 5
          },
          {
            "name": "Sarah Johnson",
            "text": "Engaging but can feel overwhelming at times.",
            "rating": 3.5
          },
          {
            "name": "David Wilson",
            "text": "A poignant exploration of heroism.",
            "rating": 4.5
          },
          {
            "name": "Jessica Taylor",
            "text": "Beautifully written but dark in parts.",
            "rating": 4
          },
          {
            "name": "Chris Martin",
            "text": "An epic tale of love and sacrifice.",
            "rating": 5
          },
          {
            "name": "Patricia Lee",
            "text": "A complex narrative that rewards patience.",
            "rating": 4
          },
          {
            "name": "Mark Thomas",
            "text": "An intricate web of characters and storylines.",
            "rating": 4.5
          },
          {
            "name": "Laura Hall",
            "text": "A profound commentary on the human condition.",
            "rating": 5
          },
          {
            "name": "Kevin Wright",
            "text": "Not for the faint of heart; deeply immersive.",
            "rating": 4
          },
          {
            "name": "Angela Young",
            "text": "A beautifully crafted fantasy world.",
            "rating": 5
          },
          {
            "name": "Daniel King",
            "text": "An iconic work that influenced modern fantasy.",
            "rating": 4.5
          },
          {
            "name": "Megan Scott",
            "text": "Every character feels deeply developed.",
            "rating": 4
          },
          {
            "name": "Samuel Lewis",
            "text": "A sweeping saga of epic proportions.",
            "rating": 5
          },
          {
            "name": "Amy Harris",
            "text": "A classic that is beautifully tragic.",
            "rating": 4
          },
          {
            "name": "Andrew Clark",
            "text": "A masterpiece of fantasy literature.",
            "rating": 5
          },
          {
            "name": "Laura Walker",
            "text": "Deeply moving and thought-provoking.",
            "rating": 4
          },
          {
            "name": "Chris Allen",
            "text": "A story that resonates through the ages.",
            "rating": 5
          },
          {
            "name": "Karen Lewis",
            "text": "A challenging yet rewarding read.",
            "rating": 4
          }
        ],
        "fan_fiction": [
          {
            "author": "Luna Lovegood",
            "short_description":
                "An alternate journey of Frodo in Middle-earth.",
            "likes": 150
          },
          {
            "author": "Aragorn's Heir",
            "short_description":
                "A tale of love and loss after the War of the Ring.",
            "likes": 120
          },
          {
            "author": "GandalfTheWhite",
            "short_description": "Exploring the untold stories of the Istari.",
            "likes": 90
          },
          {
            "author": "ElvenPrincess",
            "short_description": "A romantic adventure set in Rivendell.",
            "likes": 110
          },
          {
            "author": "HobbitFan42",
            "short_description":
                "A comedic retelling of the journey to Mount Doom.",
            "likes": 80
          }
        ]
      }
    },
    {
      "isbn": "9789358567021",
      "data": {
        "book": "Greatest Short Stories of Dostoevsky",
        "authors": ["Fyodor Dostoevsky"],
        "popularity_country": {
          "Russia": 30,
          "USA": 25,
          "Germany": 15,
          "France": 10,
          "UK": 8,
          "Japan": 5,
          "India": 4,
          "Brazil": 3
        },
        "book_read_mood": {
          "joy": 15,
          "melancholic": 25,
          "tense": 20,
          "hopeful": 10,
          "dark": 15,
          "romantic": 5,
          "nostalgic": 5,
          "humorous": 3,
          "adventurous": 2,
          "mystical": 2
        },
        "genres": [
          "Literary Fiction",
          "Psychological Fiction",
          "Philosophical Fiction"
        ],
        "themes": [
          "Existentialism",
          "Redemption",
          "Society and Class",
          "Morality"
        ],
        "sentiment": {"positive": 40, "neutral": 35, "negative": 25},
        "expert_reviews": [
          {
            "name": "John Smith",
            "text": "A profound exploration of the human psyche.",
            "rating": 5
          },
          {
            "name": "Jane Doe",
            "text": "Dostoevsky's stories are rich with moral dilemmas.",
            "rating": 4.5
          },
          {
            "name": "Alex Johnson",
            "text": "A must-read for fans of deep philosophical inquiry.",
            "rating": 4.8
          },
          {
            "name": "Emily Brown",
            "text": "Dark and melancholic yet beautifully written.",
            "rating": 4
          },
          {
            "name": "Michael Davis",
            "text": "An intricate tapestry of human emotions.",
            "rating": 4.7
          },
          {
            "name": "Sarah Wilson",
            "text": "Not for the faint-hearted, but worth it.",
            "rating": 4.2
          },
          {
            "name": "David Miller",
            "text": "Masterful storytelling that resonates through time.",
            "rating": 5
          },
          {
            "name": "Laura Garcia",
            "text": "A deep dive into despair and hope.",
            "rating": 4.3
          },
          {
            "name": "Chris Martinez",
            "text": "Brilliantly captures the human condition.",
            "rating": 4.9
          },
          {
            "name": "Anna Hernandez",
            "text": "A challenging yet rewarding read.",
            "rating": 4
          },
          {
            "name": "James Rodriguez",
            "text": "The complexity of Dostoevsky's characters is unmatched.",
            "rating": 4.6
          },
          {
            "name": "Emily Lewis",
            "text": "An exploration of moral ambiguity.",
            "rating": 4.1
          },
          {
            "name": "Brian Walker",
            "text": "A beautiful examination of the soul.",
            "rating": 4.8
          },
          {
            "name": "Jessica Hall",
            "text": "Dostoevsky’s insights are timeless.",
            "rating": 5
          },
          {
            "name": "Michael Young",
            "text": "A journey through suffering and redemption.",
            "rating": 4.4
          },
          {
            "name": "Patricia King",
            "text": "A reflection on the darker sides of life.",
            "rating": 4.2
          },
          {
            "name": "Steven Wright",
            "text": "A vivid portrayal of 19th-century Russia.",
            "rating": 4.7
          },
          {
            "name": "Linda Scott",
            "text": "Complex narratives that require reflection.",
            "rating": 4.3
          },
          {
            "name": "Gary Green",
            "text": "A treasure trove of philosophical insights.",
            "rating": 4.9
          },
          {
            "name": "Nancy Adams",
            "text": "A compelling study of human motivations.",
            "rating": 4.6
          },
          {
            "name": "Kevin Baker",
            "text": "Emotionally charged stories that linger.",
            "rating": 4.8
          }
        ],
        "fan_fiction": [
          {
            "author": "Sophia Carter",
            "short_description":
                "A retelling of Dostoevsky's work set in a modern context.",
            "likes": 120
          },
          {
            "author": "Jake Taylor",
            "short_description":
                "Exploring the lives of lesser-known characters from the stories.",
            "likes": 95
          },
          {
            "author": "Mia Lewis",
            "short_description":
                "A crossover of Dostoevsky's themes with contemporary issues.",
            "likes": 75
          },
          {
            "author": "Oliver Hall",
            "short_description":
                "A series of shorts inspired by the emotional depth of Dostoevsky.",
            "likes": 60
          },
          {
            "author": "Ella Young",
            "short_description":
                "A humorous take on Dostoevsky’s tragic characters.",
            "likes": 50
          }
        ]
      }
    },
    {
      "isbn": "9789354401473",
      "data": {
        "book": "My Inventions",
        "authors": ["Nikola Tesla"],
        "popularity_country": {
          "USA": 35,
          "Germany": 25,
          "India": 15,
          "UK": 10,
          "Japan": 5,
          "France": 5,
          "Canada": 3,
          "Australia": 2
        },
        "book_read_mood": {
          "joy": 20,
          "melancholic": 15,
          "tense": 10,
          "hopeful": 25,
          "dark": 5,
          "romantic": 8,
          "nostalgic": 12,
          "humorous": 2,
          "adventurous": 3,
          "mystical": 5
        },
        "genres": ["Biography", "Science", "History", "Philosophy"],
        "themes": [
          "Innovation",
          "Perseverance",
          "Creativity",
          "Humanity vs. Nature"
        ],
        "sentiment": {"positive": 50, "neutral": 30, "negative": 20},
        "expert_reviews": [
          {
            "name": "John Smith",
            "text": "An insightful look into the mind of a genius.",
            "rating": 5
          },
          {
            "name": "Alice Johnson",
            "text": "Tesla's thoughts are as electrifying as his inventions.",
            "rating": 4
          },
          {
            "name": "Robert Brown",
            "text": "A fascinating read but could have more depth.",
            "rating": 3
          },
          {
            "name": "Emily Davis",
            "text": "Essential reading for anyone interested in innovation.",
            "rating": 5
          },
          {
            "name": "Michael Wilson",
            "text": "Tesla's life story is both inspiring and tragic.",
            "rating": 4
          },
          {
            "name": "Jennifer Lee",
            "text": "A brilliant mind depicted with clarity and passion.",
            "rating": 5
          },
          {
            "name": "David Martinez",
            "text": "Offers a unique perspective on technological advancement.",
            "rating": 4
          },
          {
            "name": "Sarah Rodriguez",
            "text": "An intriguing mix of biography and philosophy.",
            "rating": 4
          },
          {
            "name": "Daniel Gonzalez",
            "text": "Captures the essence of Tesla's innovative spirit.",
            "rating": 5
          },
          {
            "name": "Laura Clark",
            "text": "A bit dry in parts, but overall very informative.",
            "rating": 3
          },
          {
            "name": "William Lewis",
            "text": "Great for history buffs, but not for casual readers.",
            "rating": 3
          },
          {
            "name": "Patricia Walker",
            "text":
                "Tesla's dreams are well portrayed, but needs more examples.",
            "rating": 4
          },
          {
            "name": "James Hall",
            "text": "An essential addition to any science lover's library.",
            "rating": 5
          },
          {
            "name": "Jessica Young",
            "text": "A compelling narrative, though it sometimes meanders.",
            "rating": 3
          },
          {
            "name": "Richard Allen",
            "text":
                "Incredible insights into the life of a misunderstood genius.",
            "rating": 5
          },
          {
            "name": "Nancy King",
            "text": "More about Tesla's ideas than his life; still worthwhile.",
            "rating": 4
          },
          {
            "name": "Charles Wright",
            "text": "Tesla's story is important, but the writing lacks flair.",
            "rating": 2
          },
          {
            "name": "Martha Scott",
            "text": "Engaging and thought-provoking; highly recommend.",
            "rating": 5
          },
          {
            "name": "Gary Green",
            "text": "A good mix of facts and personal anecdotes.",
            "rating": 4
          },
          {
            "name": "Deborah Adams",
            "text": "Informative but can be technical at times.",
            "rating": 3
          },
          {
            "name": "Matthew Baker",
            "text": "Explains Tesla's inventions in an accessible manner.",
            "rating": 4
          },
          {
            "name": "Emily Thompson",
            "text": "A must-read for aspiring inventors.",
            "rating": 5
          }
        ],
        "fan_fiction": [
          {
            "author": "Alice Writer",
            "short_description":
                "A fictional account of Tesla's rivalry with Edison.",
            "likes": 120
          },
          {
            "author": "Bob Creator",
            "short_description":
                "Explores Tesla's inventions in a steampunk universe.",
            "likes": 95
          },
          {
            "author": "Charlie Novelist",
            "short_description":
                "A love story intertwined with Tesla's discoveries.",
            "likes": 75
          },
          {
            "author": "Diana Storyteller",
            "short_description":
                "An alternate history where Tesla leads a tech revolution.",
            "likes": 110
          },
          {
            "author": "Evelyn Dreamer",
            "short_description": "Tesla's adventures in a parallel universe.",
            "likes": 80
          }
        ]
      }
    },
    {
      "isbn": "9789359047218",
      "data": {
        "book": "Ratan Tata",
        "authors": ["Ramprakash Singh Pavaiya"],
        "popularity_country": {
          "India": 45,
          "United States": 20,
          "United Kingdom": 10,
          "Canada": 8,
          "Australia": 7,
          "Germany": 5,
          "Singapore": 5
        },
        "book_read_mood": {
          "joy": 25,
          "melancholic": 15,
          "tense": 10,
          "hopeful": 20,
          "dark": 5,
          "romantic": 5,
          "nostalgic": 10,
          "humorous": 3,
          "adventurous": 4,
          "mystical": 3
        },
        "genres": ["Biography", "Motivational", "Self-Help"],
        "themes": [
          "Leadership",
          "Entrepreneurship",
          "Social Responsibility",
          "Philanthropy"
        ],
        "sentiment": {"positive": 60, "neutral": 30, "negative": 10},
        "expert_reviews": [
          {
            "name": "John Doe",
            "text":
                "An inspiring account of one of India's most revered industrialists.",
            "rating": 5
          },
          {
            "name": "Jane Smith",
            "text":
                "A comprehensive look into Ratan Tata's life and contributions.",
            "rating": 4
          },
          {
            "name": "Alex Johnson",
            "text":
                "The book is well-written but lacks depth in certain areas.",
            "rating": 3
          },
          {
            "name": "Emily Davis",
            "text":
                "Captivating and motivational. A must-read for aspiring leaders.",
            "rating": 5
          },
          {
            "name": "Michael Brown",
            "text":
                "Provides valuable insights into corporate ethics and leadership.",
            "rating": 4
          },
          {
            "name": "Sarah Wilson",
            "text": "An enjoyable read, though a bit too idealistic at times.",
            "rating": 3
          },
          {
            "name": "Robert Taylor",
            "text":
                "A solid biography that portrays Tata's influence on modern India.",
            "rating": 4
          },
          {
            "name": "Laura Martin",
            "text":
                "Engaging and enlightening, especially for business students.",
            "rating": 5
          },
          {
            "name": "David Lee",
            "text":
                "Interesting but could have included more personal anecdotes.",
            "rating": 3
          },
          {
            "name": "Linda Clark",
            "text": "A tribute to Tata's legacy and contributions to society.",
            "rating": 5
          },
          {
            "name": "Mark Walker",
            "text": "Inspiring but felt rushed in the latter chapters.",
            "rating": 3
          },
          {
            "name": "Nancy Hall",
            "text": "A fantastic portrayal of a visionary leader.",
            "rating": 4
          },
          {
            "name": "Karen Adams",
            "text":
                "Motivational but not groundbreaking in its narrative style.",
            "rating": 3
          },
          {
            "name": "James Scott",
            "text":
                "An excellent read for anyone interested in Indian business.",
            "rating": 4
          },
          {
            "name": "Patricia Green",
            "text": "Insightful and well-researched, highly recommended.",
            "rating": 5
          },
          {
            "name": "Jennifer Perez",
            "text": "A good biography that misses some key challenges faced.",
            "rating": 3
          },
          {
            "name": "Charles Evans",
            "text": "A detailed account of Tata's business acumen.",
            "rating": 4
          },
          {
            "name": "Susan Edwards",
            "text": "Inspiring but lacking personal touch.",
            "rating": 3
          },
          {
            "name": "George Harris",
            "text": "A great read for aspiring entrepreneurs.",
            "rating": 5
          },
          {
            "name": "Sarah Baker",
            "text": "Well-organized and engaging biography.",
            "rating": 4
          },
          {
            "name": "Joseph Turner",
            "text": "Detailed but at times too analytical.",
            "rating": 3
          },
          {
            "name": "Barbara King",
            "text": "A compelling read about a remarkable life.",
            "rating": 5
          }
        ],
        "fan_fiction": [
          {
            "author": "Alice Smith",
            "short_description":
                "A creative reimagining of Ratan Tata's life if he had pursued a career in politics.",
            "likes": 120
          },
          {
            "author": "Bob Johnson",
            "short_description":
                "A humorous take on Ratan Tata's adventures in the corporate world.",
            "likes": 95
          },
          {
            "author": "Catherine Lee",
            "short_description":
                "Explores the relationship between Ratan Tata and his mentors.",
            "likes": 78
          },
          {
            "author": "Daniel Green",
            "short_description":
                "A romantic story involving Ratan Tata's early years.",
            "likes": 65
          },
          {
            "author": "Ella Brown",
            "short_description":
                "An adventurous tale of Ratan Tata's business challenges during the early 2000s.",
            "likes": 50
          }
        ]
      }
    },
    {
      "isbn": "9780062273208",
      "data": {
        "book": "The Hard Thing About Hard Things",
        "authors": ["Ben Horowitz"],
        "popularity_country": {
          "USA": 35,
          "Canada": 20,
          "UK": 15,
          "Australia": 10,
          "Germany": 8,
          "India": 7,
          "Japan": 5
        },
        "book_read_mood": {
          "joy": 25,
          "melancholic": 10,
          "tense": 20,
          "hopeful": 15,
          "dark": 10,
          "romantic": 5,
          "nostalgic": 5,
          "humorous": 3,
          "adventurous": 4,
          "mystical": 3
        },
        "genres": ["Business", "Non-Fiction", "Self-Help"],
        "themes": [
          "Leadership",
          "Entrepreneurship",
          "Resilience",
          "Overcoming Adversity"
        ],
        "sentiment": {"positive": 50, "neutral": 30, "negative": 20},
        "expert_reviews": [
          {
            "name": "Reviewer 1",
            "text":
                "An insightful look into the challenges of entrepreneurship.",
            "rating": 5
          },
          {
            "name": "Reviewer 2",
            "text": "A must-read for anyone in a leadership position.",
            "rating": 4
          },
          {
            "name": "Reviewer 3",
            "text": "Valuable lessons wrapped in real-life experiences.",
            "rating": 4
          },
          {
            "name": "Reviewer 4",
            "text":
                "Not for the faint-hearted, but rewarding for the determined.",
            "rating": 5
          },
          {
            "name": "Reviewer 5",
            "text":
                "Pragmatic and brutally honest about the struggles of business.",
            "rating": 4
          },
          {
            "name": "Reviewer 6",
            "text": "Candid and insightful; Horowitz knows his stuff.",
            "rating": 5
          },
          {
            "name": "Reviewer 7",
            "text": "Essential reading for aspiring entrepreneurs.",
            "rating": 4
          },
          {
            "name": "Reviewer 8",
            "text": "A bit too harsh at times, but ultimately very helpful.",
            "rating": 3
          },
          {
            "name": "Reviewer 9",
            "text": "Packed with real-life examples and practical advice.",
            "rating": 4
          },
          {
            "name": "Reviewer 10",
            "text": "Excellent insights but may not resonate with everyone.",
            "rating": 3
          },
          {
            "name": "Reviewer 11",
            "text":
                "Horowitz's experiences are both relatable and enlightening.",
            "rating": 5
          },
          {
            "name": "Reviewer 12",
            "text": "A tough love approach that pays off in wisdom.",
            "rating": 4
          },
          {
            "name": "Reviewer 13",
            "text":
                "Provides a realistic view of the ups and downs of business.",
            "rating": 5
          },
          {
            "name": "Reviewer 14",
            "text":
                "A brilliant guide to navigating tough business challenges.",
            "rating": 4
          },
          {
            "name": "Reviewer 15",
            "text": "Horowitz’s writing is engaging and full of insight.",
            "rating": 5
          },
          {
            "name": "Reviewer 16",
            "text":
                "Highly practical advice for real-world business situations.",
            "rating": 4
          },
          {
            "name": "Reviewer 17",
            "text": "A powerful read for anyone in business leadership.",
            "rating": 5
          },
          {
            "name": "Reviewer 18",
            "text": "Great book, but some parts are a bit repetitive.",
            "rating": 3
          },
          {
            "name": "Reviewer 19",
            "text": "Invaluable lessons from a seasoned entrepreneur.",
            "rating": 4
          },
          {
            "name": "Reviewer 20",
            "text": "Realistic, insightful, and brutally honest.",
            "rating": 5
          }
        ],
        "fan_fiction": [
          {
            "author": "Fan Author 1",
            "short_description":
                "A reimagined journey through the startup world.",
            "likes": 150
          },
          {
            "author": "Fan Author 2",
            "short_description":
                "A humorous take on the struggles of entrepreneurship.",
            "likes": 120
          },
          {
            "author": "Fan Author 3",
            "short_description":
                "Explores a fictional tech startup and its challenges.",
            "likes": 200
          },
          {
            "author": "Fan Author 4",
            "short_description":
                "A romantic subplot intertwined with business failures.",
            "likes": 80
          },
          {
            "author": "Fan Author 5",
            "short_description":
                "An adventurous retelling of Horowitz's experiences.",
            "likes": 90
          }
        ]
      }
    },
    {
      "isbn": "0048232300",
      "data": {
        "book": "Book Title 300",
        "authors": ["Author 00"],
        "popularity_country": {
          "United States": 0,
          "United Kingdom": 0,
          "Germany": 6,
          "Russia": 30,
          "USA": 25,
          "France": 10,
          "UK": 8,
          "Japan": 5,
          "India": 4,
          "Brazil": 3
        },
        "book_read_mood": {
          "joy": 30,
          "melancholic": 20,
          "tense": 12,
          "action": 50,
          "fun": 80,
          "suspense": 40,
        },
        "genres": ["Genre A", "Genre B", "Genre 0"],
        "themes": ["Theme 00", "Theme 300"],
        "sentiment": {"positive": 0, "neutral": 0, "negative": 3},
        "expert_reviews": [
          {
            "name": "John Doe",
            "text": "Review 1 about Book 300",
            "rating": 3.0
          },
          {
            "name": "Jane Smith",
            "text": "Review 2 about Book 300",
            "rating": 3.5
          },
          {
            "name": "Robert Brown",
            "text": "Review 3 about Book 300",
            "rating": 4.0
          },
          {
            "name": "Emily White",
            "text": "Review 4 about Book 300",
            "rating": 3.0
          },
          {
            "name": "Michael Green",
            "text": "Review 5 about Book 300",
            "rating": 3.5
          },
          {
            "name": "Sarah Johnson",
            "text": "Review 6 about Book 300",
            "rating": 4.0
          },
          {
            "name": "David Wilson",
            "text": "Review 7 about Book 300",
            "rating": 3.0
          },
          {
            "name": "Jessica Taylor",
            "text": "Review 8 about Book 300",
            "rating": 3.5
          },
          {
            "name": "John Doe",
            "text": "Review 9 about Book 300",
            "rating": 4.0
          },
          {
            "name": "Jane Smith",
            "text": "Review 10 about Book 300",
            "rating": 3.0
          }
        ],
        "fan_fiction": [
          {
            "author": "Luna Lovegood",
            "short_description": "Fan fiction 1 inspired by Book 300",
            "likes": 10
          },
          {
            "author": "Aragorn's Heir",
            "short_description": "Fan fiction 2 inspired by Book 300",
            "likes": 20
          },
          {
            "author": "GandalfTheWhite",
            "short_description": "Fan fiction 3 inspired by Book 300",
            "likes": 30
          },
          {
            "author": "ElvenPrincess",
            "short_description": "Fan fiction 4 inspired by Book 300",
            "likes": 40
          },
          {
            "author": "HobbitFan42",
            "short_description": "Fan fiction 5 inspired by Book 300",
            "likes": 50
          },
          {
            "author": "BilboDreamer",
            "short_description": "Fan fiction 6 inspired by Book 300",
            "likes": 60
          },
          {
            "author": "FrodoBagginsLover",
            "short_description": "Fan fiction 7 inspired by Book 300",
            "likes": 70
          },
          {
            "author": "SamwiseTheBrave",
            "short_description": "Fan fiction 8 inspired by Book 300",
            "likes": 80
          },
          {
            "author": "Luna Lovegood",
            "short_description": "Fan fiction 9 inspired by Book 300",
            "likes": 90
          },
          {
            "author": "Aragorn's Heir",
            "short_description": "Fan fiction 10 inspired by Book 300",
            "likes": 100
          }
        ]
      }
    },
    {
      "isbn": "0261103598",
      "data": {
        "book": "Book Title 598",
        "authors": ["Author 98"],
        "popularity_country": {
          "United States": 80,
          "United Kingdom": 45,
          "Russia": 30,
          "USA": 25,
          "Germany": 15,
          "France": 10,
          "UK": 8,
          "Japan": 5,
          "India": 4,
          "Brazil": 60
        },
        "book_read_mood": {"joy": 40, "melancholic": 27, "tense": 20},
        "genres": ["Genre A", "Genre B", "Genre 8"],
        "themes": ["Theme 98", "Theme 598"],
        "sentiment": {"positive": 48, "neutral": 27, "negative": 5},
        "expert_reviews": [
          {
            "name": "Robert Brown",
            "text": "Review 1 about Book 598",
            "rating": 3.0
          },
          {
            "name": "Emily White",
            "text": "Review 2 about Book 598",
            "rating": 3.5
          },
          {
            "name": "Michael Green",
            "text": "Review 3 about Book 598",
            "rating": 4.0
          },
          {
            "name": "Sarah Johnson",
            "text": "Review 4 about Book 598",
            "rating": 3.0
          },
          {
            "name": "David Wilson",
            "text": "Review 5 about Book 598",
            "rating": 3.5
          },
          {
            "name": "Jessica Taylor",
            "text": "Review 6 about Book 598",
            "rating": 4.0
          },
          {
            "name": "John Doe",
            "text": "Review 7 about Book 598",
            "rating": 3.0
          },
          {
            "name": "Jane Smith",
            "text": "Review 8 about Book 598",
            "rating": 3.5
          },
          {
            "name": "Robert Brown",
            "text": "Review 9 about Book 598",
            "rating": 4.0
          },
          {
            "name": "Emily White",
            "text": "Review 10 about Book 598",
            "rating": 3.0
          }
        ],
        "fan_fiction": [
          {
            "author": "GandalfTheWhite",
            "short_description": "Fan fiction 1 inspired by Book 598",
            "likes": 10
          },
          {
            "author": "ElvenPrincess",
            "short_description": "Fan fiction 2 inspired by Book 598",
            "likes": 20
          },
          {
            "author": "HobbitFan42",
            "short_description": "Fan fiction 3 inspired by Book 598",
            "likes": 30
          },
          {
            "author": "BilboDreamer",
            "short_description": "Fan fiction 4 inspired by Book 598",
            "likes": 40
          },
          {
            "author": "FrodoBagginsLover",
            "short_description": "Fan fiction 5 inspired by Book 598",
            "likes": 50
          },
          {
            "author": "SamwiseTheBrave",
            "short_description": "Fan fiction 6 inspired by Book 598",
            "likes": 60
          },
          {
            "author": "Luna Lovegood",
            "short_description": "Fan fiction 7 inspired by Book 598",
            "likes": 70
          },
          {
            "author": "Aragorn's Heir",
            "short_description": "Fan fiction 8 inspired by Book 598",
            "likes": 80
          },
          {
            "author": "GandalfTheWhite",
            "short_description": "Fan fiction 9 inspired by Book 598",
            "likes": 90
          },
          {
            "author": "ElvenPrincess",
            "short_description": "Fan fiction 10 inspired by Book 598",
            "likes": 100
          }
        ]
      }
    },
    {
      "isbn": "9780547951973",
      "data": {
        "book": "Book Title 973",
        "authors": ["Author 73"],
        "popularity_country": {
          "United States": 30,
          "United Kingdom": 35,
          "Germany": 18,
          "Russia": 30,
          "USA": 25,
          "France": 10,
          "UK": 8,
          "Japan": 5,
          "India": 4,
          "Brazil": 3
        },
        "book_read_mood": {"joy": 15, "melancholic": 21, "tense": 36},
        "genres": ["Genre A", "Genre B", "Genre 3"],
        "themes": ["Theme 73", "Theme 973"],
        "sentiment": {"positive": 18, "neutral": 21, "negative": 9},
        "expert_reviews": [
          {
            "name": "Michael Green",
            "text": "Review 1 about Book 973",
            "rating": 3.0
          },
          {
            "name": "Sarah Johnson",
            "text": "Review 2 about Book 973",
            "rating": 3.5
          },
          {
            "name": "David Wilson",
            "text": "Review 3 about Book 973",
            "rating": 4.0
          },
          {
            "name": "Jessica Taylor",
            "text": "Review 4 about Book 973",
            "rating": 3.0
          },
          {
            "name": "John Doe",
            "text": "Review 5 about Book 973",
            "rating": 3.5
          },
          {
            "name": "Jane Smith",
            "text": "Review 6 about Book 973",
            "rating": 4.0
          },
          {
            "name": "Robert Brown",
            "text": "Review 7 about Book 973",
            "rating": 3.0
          },
          {
            "name": "Emily White",
            "text": "Review 8 about Book 973",
            "rating": 3.5
          },
          {
            "name": "Michael Green",
            "text": "Review 9 about Book 973",
            "rating": 4.0
          },
          {
            "name": "Sarah Johnson",
            "text": "Review 10 about Book 973",
            "rating": 3.0
          }
        ],
        "fan_fiction": [
          {
            "author": "HobbitFan42",
            "short_description": "Fan fiction 1 inspired by Book 973",
            "likes": 10
          },
          {
            "author": "BilboDreamer",
            "short_description": "Fan fiction 2 inspired by Book 973",
            "likes": 20
          },
          {
            "author": "FrodoBagginsLover",
            "short_description": "Fan fiction 3 inspired by Book 973",
            "likes": 30
          },
          {
            "author": "SamwiseTheBrave",
            "short_description": "Fan fiction 4 inspired by Book 973",
            "likes": 40
          },
          {
            "author": "Luna Lovegood",
            "short_description": "Fan fiction 5 inspired by Book 973",
            "likes": 50
          },
          {
            "author": "Aragorn's Heir",
            "short_description": "Fan fiction 6 inspired by Book 973",
            "likes": 60
          },
          {
            "author": "GandalfTheWhite",
            "short_description": "Fan fiction 7 inspired by Book 973",
            "likes": 70
          },
          {
            "author": "ElvenPrincess",
            "short_description": "Fan fiction 8 inspired by Book 973",
            "likes": 80
          },
          {
            "author": "HobbitFan42",
            "short_description": "Fan fiction 9 inspired by Book 973",
            "likes": 90
          },
          {
            "author": "BilboDreamer",
            "short_description": "Fan fiction 10 inspired by Book 973",
            "likes": 100
          }
        ]
      }
    },
    {
      "isbn": "9780345538376",
      "data": {
        "book": "Book Title 376",
        "authors": ["Author 76"],
        "popularity_country": {
          "United States": 60,
          "United Kingdom": 35,
          "Germany": 6,
          "Russia": 30,
          "USA": 25,
          "France": 10,
          "UK": 8,
          "Japan": 50,
          "India": 4,
          "Brazil": 40
        },
        "book_read_mood": {"joy": 30, "melancholic": 21, "tense": 12},
        "genres": ["Genre A", "Genre B", "Genre 6"],
        "themes": ["Theme 76", "Theme 376"],
        "sentiment": {"positive": 36, "neutral": 21, "negative": 3},
        "expert_reviews": [
          {
            "name": "David Wilson",
            "text": "Review 1 about Book 376",
            "rating": 3.0
          },
          {
            "name": "Jessica Taylor",
            "text": "Review 2 about Book 376",
            "rating": 3.5
          },
          {
            "name": "John Doe",
            "text": "Review 3 about Book 376",
            "rating": 4.0
          },
          {
            "name": "Jane Smith",
            "text": "Review 4 about Book 376",
            "rating": 3.0
          },
          {
            "name": "Robert Brown",
            "text": "Review 5 about Book 376",
            "rating": 3.5
          },
          {
            "name": "Emily White",
            "text": "Review 6 about Book 376",
            "rating": 4.0
          },
          {
            "name": "Michael Green",
            "text": "Review 7 about Book 376",
            "rating": 3.0
          },
          {
            "name": "Sarah Johnson",
            "text": "Review 8 about Book 376",
            "rating": 3.5
          },
          {
            "name": "David Wilson",
            "text": "Review 9 about Book 376",
            "rating": 4.0
          },
          {
            "name": "Jessica Taylor",
            "text": "Review 10 about Book 376",
            "rating": 3.0
          }
        ],
        "fan_fiction": [
          {
            "author": "FrodoBagginsLover",
            "short_description": "Fan fiction 1 inspired by Book 376",
            "likes": 10
          },
          {
            "author": "SamwiseTheBrave",
            "short_description": "Fan fiction 2 inspired by Book 376",
            "likes": 20
          },
          {
            "author": "Luna Lovegood",
            "short_description": "Fan fiction 3 inspired by Book 376",
            "likes": 30
          },
          {
            "author": "Aragorn's Heir",
            "short_description": "Fan fiction 4 inspired by Book 376",
            "likes": 40
          },
          {
            "author": "GandalfTheWhite",
            "short_description": "Fan fiction 5 inspired by Book 376",
            "likes": 50
          },
          {
            "author": "ElvenPrincess",
            "short_description": "Fan fiction 6 inspired by Book 376",
            "likes": 60
          },
          {
            "author": "HobbitFan42",
            "short_description": "Fan fiction 7 inspired by Book 376",
            "likes": 70
          },
          {
            "author": "BilboDreamer",
            "short_description": "Fan fiction 8 inspired by Book 376",
            "likes": 80
          },
          {
            "author": "FrodoBagginsLover",
            "short_description": "Fan fiction 9 inspired by Book 376",
            "likes": 90
          },
          {
            "author": "SamwiseTheBrave",
            "short_description": "Fan fiction 10 inspired by Book 376",
            "likes": 100
          }
        ]
      }
    },
    {
      "isbn": "0618260250",
      "data": {
        "book": "Book Title 250",
        "authors": ["Author 50"],
        "popularity_country": {
          "United States": 0,
          "United Kingdom": 25,
          "Germany": 4,
          "Russia": 30,
          "USA": 25,
          "France": 10,
          "UK": 8,
          "Japan": 5,
          "India": 4,
          "Brazil": 3
        },
        "book_read_mood": {"joy": 0, "melancholic": 15, "tense": 8},
        "genres": ["Genre A", "Genre B", "Genre 0"],
        "themes": ["Theme 50", "Theme 250"],
        "sentiment": {"positive": 0, "neutral": 15, "negative": 2},
        "expert_reviews": [
          {
            "name": "John Doe",
            "text": "Review 1 about Book 250",
            "rating": 3.0
          },
          {
            "name": "Jane Smith",
            "text": "Review 2 about Book 250",
            "rating": 3.5
          },
          {
            "name": "Robert Brown",
            "text": "Review 3 about Book 250",
            "rating": 4.0
          },
          {
            "name": "Emily White",
            "text": "Review 4 about Book 250",
            "rating": 3.0
          },
          {
            "name": "Michael Green",
            "text": "Review 5 about Book 250",
            "rating": 3.5
          },
          {
            "name": "Sarah Johnson",
            "text": "Review 6 about Book 250",
            "rating": 4.0
          },
          {
            "name": "David Wilson",
            "text": "Review 7 about Book 250",
            "rating": 3.0
          },
          {
            "name": "Jessica Taylor",
            "text": "Review 8 about Book 250",
            "rating": 3.5
          },
          {
            "name": "John Doe",
            "text": "Review 9 about Book 250",
            "rating": 4.0
          },
          {
            "name": "Jane Smith",
            "text": "Review 10 about Book 250",
            "rating": 3.0
          }
        ],
        "fan_fiction": [
          {
            "author": "Luna Lovegood",
            "short_description": "Fan fiction 1 inspired by Book 250",
            "likes": 10
          },
          {
            "author": "Aragorn's Heir",
            "short_description": "Fan fiction 2 inspired by Book 250",
            "likes": 20
          },
          {
            "author": "GandalfTheWhite",
            "short_description": "Fan fiction 3 inspired by Book 250",
            "likes": 30
          },
          {
            "author": "ElvenPrincess",
            "short_description": "Fan fiction 4 inspired by Book 250",
            "likes": 40
          },
          {
            "author": "HobbitFan42",
            "short_description": "Fan fiction 5 inspired by Book 250",
            "likes": 50
          },
          {
            "author": "BilboDreamer",
            "short_description": "Fan fiction 6 inspired by Book 250",
            "likes": 60
          },
          {
            "author": "FrodoBagginsLover",
            "short_description": "Fan fiction 7 inspired by Book 250",
            "likes": 70
          },
          {
            "author": "SamwiseTheBrave",
            "short_description": "Fan fiction 8 inspired by Book 250",
            "likes": 80
          },
          {
            "author": "Luna Lovegood",
            "short_description": "Fan fiction 9 inspired by Book 250",
            "likes": 90
          },
          {
            "author": "Aragorn's Heir",
            "short_description": "Fan fiction 10 inspired by Book 250",
            "likes": 100
          }
        ]
      }
    },
    {
      "isbn": "0345339681",
      "data": {
        "book": "Book Title 681",
        "authors": ["Author 81"],
        "popularity_country": {
          "United States": 10,
          "United Kingdom": 40,
          "Germany": 12,
          "Russia": 30,
          "USA": 25,
          "France": 10,
          "UK": 8,
          "Japan": 5,
          "India": 4,
          "Brazil": 3
        },
        "book_read_mood": {"joy": 5, "melancholic": 24, "tense": 24},
        "genres": ["Genre A", "Genre B", "Genre 1"],
        "themes": ["Theme 81", "Theme 681"],
        "sentiment": {"positive": 6, "neutral": 24, "negative": 6},
        "expert_reviews": [
          {
            "name": "Robert Brown",
            "text": "Review 1 about Book 681",
            "rating": 3.0
          },
          {
            "name": "Emily White",
            "text": "Review 2 about Book 681",
            "rating": 3.5
          },
          {
            "name": "Michael Green",
            "text": "Review 3 about Book 681",
            "rating": 4.0
          },
          {
            "name": "Sarah Johnson",
            "text": "Review 4 about Book 681",
            "rating": 3.0
          },
          {
            "name": "David Wilson",
            "text": "Review 5 about Book 681",
            "rating": 3.5
          },
          {
            "name": "Jessica Taylor",
            "text": "Review 6 about Book 681",
            "rating": 4.0
          },
          {
            "name": "John Doe",
            "text": "Review 7 about Book 681",
            "rating": 3.0
          },
          {
            "name": "Jane Smith",
            "text": "Review 8 about Book 681",
            "rating": 3.5
          },
          {
            "name": "Robert Brown",
            "text": "Review 9 about Book 681",
            "rating": 4.0
          },
          {
            "name": "Emily White",
            "text": "Review 10 about Book 681",
            "rating": 3.0
          }
        ],
        "fan_fiction": [
          {
            "author": "GandalfTheWhite",
            "short_description": "Fan fiction 1 inspired by Book 681",
            "likes": 10
          },
          {
            "author": "ElvenPrincess",
            "short_description": "Fan fiction 2 inspired by Book 681",
            "likes": 20
          },
          {
            "author": "HobbitFan42",
            "short_description": "Fan fiction 3 inspired by Book 681",
            "likes": 30
          },
          {
            "author": "BilboDreamer",
            "short_description": "Fan fiction 4 inspired by Book 681",
            "likes": 40
          },
          {
            "author": "FrodoBagginsLover",
            "short_description": "Fan fiction 5 inspired by Book 681",
            "likes": 50
          },
          {
            "author": "SamwiseTheBrave",
            "short_description": "Fan fiction 6 inspired by Book 681",
            "likes": 60
          },
          {
            "author": "Luna Lovegood",
            "short_description": "Fan fiction 7 inspired by Book 681",
            "likes": 70
          },
          {
            "author": "Aragorn's Heir",
            "short_description": "Fan fiction 8 inspired by Book 681",
            "likes": 80
          },
          {
            "author": "GandalfTheWhite",
            "short_description": "Fan fiction 9 inspired by Book 681",
            "likes": 90
          },
          {
            "author": "ElvenPrincess",
            "short_description": "Fan fiction 10 inspired by Book 681",
            "likes": 100
          }
        ]
      }
    },
    {
      "isbn": "9780007252268",
      "data": {
        "book": "Book Title 268",
        "authors": ["Author 68"],
        "popularity_country": {
          "United States": 80,
          "United Kingdom": 30,
          "Germany": 4,
          "Russia": 30,
          "USA": 25,
          "France": 10,
          "UK": 8,
          "Japan": 5,
          "India": 60,
          "Brazil": 70
        },
        "book_read_mood": {"joy": 40, "melancholic": 18, "tense": 8},
        "genres": ["Genre A", "Genre B", "Genre 8"],
        "themes": ["Theme 68", "Theme 268"],
        "sentiment": {"positive": 48, "neutral": 18, "negative": 2},
        "expert_reviews": [
          {
            "name": "Michael Green",
            "text": "Review 1 about Book 268",
            "rating": 3.0
          },
          {
            "name": "Sarah Johnson",
            "text": "Review 2 about Book 268",
            "rating": 3.5
          },
          {
            "name": "David Wilson",
            "text": "Review 3 about Book 268",
            "rating": 4.0
          },
          {
            "name": "Jessica Taylor",
            "text": "Review 4 about Book 268",
            "rating": 3.0
          },
          {
            "name": "John Doe",
            "text": "Review 5 about Book 268",
            "rating": 3.5
          },
          {
            "name": "Jane Smith",
            "text": "Review 6 about Book 268",
            "rating": 4.0
          },
          {
            "name": "Robert Brown",
            "text": "Review 7 about Book 268",
            "rating": 3.0
          },
          {
            "name": "Emily White",
            "text": "Review 8 about Book 268",
            "rating": 3.5
          },
          {
            "name": "Michael Green",
            "text": "Review 9 about Book 268",
            "rating": 4.0
          },
          {
            "name": "Sarah Johnson",
            "text": "Review 10 about Book 268",
            "rating": 3.0
          }
        ],
        "fan_fiction": [
          {
            "author": "HobbitFan42",
            "short_description": "Fan fiction 1 inspired by Book 268",
            "likes": 10
          },
          {
            "author": "BilboDreamer",
            "short_description": "Fan fiction 2 inspired by Book 268",
            "likes": 20
          },
          {
            "author": "FrodoBagginsLover",
            "short_description": "Fan fiction 3 inspired by Book 268",
            "likes": 30
          },
          {
            "author": "SamwiseTheBrave",
            "short_description": "Fan fiction 4 inspired by Book 268",
            "likes": 40
          },
          {
            "author": "Luna Lovegood",
            "short_description": "Fan fiction 5 inspired by Book 268",
            "likes": 50
          },
          {
            "author": "Aragorn's Heir",
            "short_description": "Fan fiction 6 inspired by Book 268",
            "likes": 60
          },
          {
            "author": "GandalfTheWhite",
            "short_description": "Fan fiction 7 inspired by Book 268",
            "likes": 70
          },
          {
            "author": "ElvenPrincess",
            "short_description": "Fan fiction 8 inspired by Book 268",
            "likes": 80
          },
          {
            "author": "HobbitFan42",
            "short_description": "Fan fiction 9 inspired by Book 268",
            "likes": 90
          },
          {
            "author": "BilboDreamer",
            "short_description": "Fan fiction 10 inspired by Book 268",
            "likes": 100
          }
        ]
      }
    },
    {
      "isbn": "9780345466457",
      "data": {
        "book": "Book Title 998",
        "authors": ["Author 98"],
        "popularity_country": {
          "United States": 80,
          "United Kingdom": 45,
          "Germany": 18,
          "Russia": 30,
          "USA": 25,
          "France": 10,
          "UK": 8,
          "Japan": 5,
          "India": 4,
          "Brazil": 3
        },
        "book_read_mood": {"joy": 40, "melancholic": 27, "tense": 36},
        "genres": ["Genre A", "Genre B", "Genre 8"],
        "themes": ["Theme 98", "Theme 998"],
        "sentiment": {"positive": 48, "neutral": 27, "negative": 9},
        "expert_reviews": [
          {
            "name": "David Wilson",
            "text": "Review 1 about Book 998",
            "rating": 3.0
          },
          {
            "name": "Jessica Taylor",
            "text": "Review 2 about Book 998",
            "rating": 3.5
          },
          {
            "name": "John Doe",
            "text": "Review 3 about Book 998",
            "rating": 4.0
          },
          {
            "name": "Jane Smith",
            "text": "Review 4 about Book 998",
            "rating": 3.0
          },
          {
            "name": "Robert Brown",
            "text": "Review 5 about Book 998",
            "rating": 3.5
          },
          {
            "name": "Emily White",
            "text": "Review 6 about Book 998",
            "rating": 4.0
          },
          {
            "name": "Michael Green",
            "text": "Review 7 about Book 998",
            "rating": 3.0
          },
          {
            "name": "Sarah Johnson",
            "text": "Review 8 about Book 998",
            "rating": 3.5
          },
          {
            "name": "David Wilson",
            "text": "Review 9 about Book 998",
            "rating": 4.0
          },
          {
            "name": "Jessica Taylor",
            "text": "Review 10 about Book 998",
            "rating": 3.0
          }
        ],
        "fan_fiction": [
          {
            "author": "FrodoBagginsLover",
            "short_description": "Fan fiction 1 inspired by Book 998",
            "likes": 10
          },
          {
            "author": "SamwiseTheBrave",
            "short_description": "Fan fiction 2 inspired by Book 998",
            "likes": 20
          },
          {
            "author": "Luna Lovegood",
            "short_description": "Fan fiction 3 inspired by Book 998",
            "likes": 30
          },
          {
            "author": "Aragorn's Heir",
            "short_description": "Fan fiction 4 inspired by Book 998",
            "likes": 40
          },
          {
            "author": "GandalfTheWhite",
            "short_description": "Fan fiction 5 inspired by Book 998",
            "likes": 50
          },
          {
            "author": "ElvenPrincess",
            "short_description": "Fan fiction 6 inspired by Book 998",
            "likes": 60
          },
          {
            "author": "HobbitFan42",
            "short_description": "Fan fiction 7 inspired by Book 998",
            "likes": 70
          },
          {
            "author": "BilboDreamer",
            "short_description": "Fan fiction 8 inspired by Book 998",
            "likes": 80
          },
          {
            "author": "FrodoBagginsLover",
            "short_description": "Fan fiction 9 inspired by Book 998",
            "likes": 90
          },
          {
            "author": "SamwiseTheBrave",
            "short_description": "Fan fiction 10 inspired by Book 998",
            "likes": 100
          }
        ]
      }
    }
  ];
}
