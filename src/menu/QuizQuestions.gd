var questions = [
	[
		"What is the balance factor of an AVL node?",
		["height(right) – height(left)", "height(left) + height(right)", "height(left) – height(right)"],
		2
	],
	[
		"What must the balance factor of any AVL node always satisfy?",
		["Must be exactly 0", "Must be ≤ −2", "Must be in the range [−1, 1]"],
		2
	],
	[
		"A Left-Left (LL) imbalance is fixed using which rotation?",
		["Left rotation", "Right rotation", "Right-Left rotation"],
		1
	],
	[
		"A Right-Right (RR) imbalance is fixed using which rotation?",
		["Left rotation", "Left-Right rotation", "Right-Left rotation"],
		0
	],
	[
		"After a rotation, what must be updated?",
		["Only the root pointer", "Only subtree pointers", "Heights of affected nodes"],
		2
	],
	[
		"What should getHeight(nullptr) return in an AVL tree?",
		["1", "−1", "It should throw an error"],
		1
	],
	[
		"What condition triggers an AVL rotation?",
		["Height difference becomes exactly 0", "Balance factor < −1 or > +1", "Every time a new node is added"],
		1
	],
	[
		"In what order are operations done during a rotation?",
		["Rotate, then update heights", "Update heights, then rotate", "Compute balance, then return"],
		0
	],
	[
		"Why do AVL trees perform rotations at all?",
		["To prevent inserting duplicates",  "To keep depth O(log n)", "To avoid segmentation faults"],
		1
	],
	[
		"A left rotation does what?",
		["Promotes left child", "Promotes right child", "Swaps only height values"],
		1
	],
	[
		"In a Right-Right imbalance, which side is heavy?",
		["Left subtree", "Right subtree", "Both sides"],
		1
	],
	[
		"What happens if you forget to update node heights after rotation?",
		[ "Future balance factors will be wrong", "Insertions will be faster", "Nodes will be deleted accidentally"],
		0
	],
	[
		"Which sorting method works by repeatedly swapping adjacent elements if out of order?",
		["Bubble Sort", "Merge Sort", "QuickSort"],
		0
	],
	[
		"Which sorting algorithm is stable?",
		["QuickSort",  "Merge Sort", "Heap Sort"],
		1
	],
	[
		"What is the worst-case time complexity of QuickSort?",
		["O(n log n)", "O(n)", "O(n²)"],
		2
	],
	[
		"What is the time complexity of Merge Sort?",
		["O(n)", "O(n log n)", "O(log n)"],
		1
	],
	[
		"What is a load factor?",
		["Total memory used", "Number of collisions", "size / capacity"],
		2
	],
	[
		"What happens when a hash table becomes too full (high load factor)?",
		["Search becomes faster", "Collisions increase",  "Hash function changes automatically"],
		1
	],
	[
		"Which method resolves collisions by chaining?",
		["Using a linked list at each bucket", "Resizing the table", "Rehashing"],
		0
	],
	[
		"What causes collisions in a hash table?",
		["Too much memory", "Two keys hash to the same index",  "Keys too similar"],
		1
	],
	[
		"What is the average time complexity of searching in a hash map?",
		["O(1)", "O(log n)", "O(n log n)"],
		0
	],
	[
		"How many children can a binary tree node have at most?",
		["1", "2", "Unlimited"],
		1
	],
	[
		"What traversal prints values in sorted order for a BST?",
		["Preorder", "Postorder", "Inorder"],
		2
	],
	[
		"What is the worst-case find of a BST?",
		[ "O(log n)", "O(n)", "O(n²)"],
		1
	],
	[
		"What is a disadvantage of arrays?",
		["They have slow access times", "They cannot store integers", "Fixed size"],
		2
	],
	[
		"What happens when an array is full and you try to append an element?",
		["It crashes",  "A bigger array must be allocated", "The new element overwrites an old one"],
		1
	],
	[
		"What is the time complexity of searching for an element in an unsorted linked list?",
		["O(log n)", "O(1)", "O(n)"],
		2
	],
	[
		"In a doubly linked list, what does each node store?",
		["Data + 1 pointer", "Data + 2 pointers", "Data + 3 pointers"],
		1
	],
	[
		"What is the main disadvantage of a linked list compared to an array?",
		["Slow search times", "Limited size", "Cannot delete"],
		0
	]
];

var current_question_index = 0

func get_next_question():
	if current_question_index >= questions.size():
		return null  # No more questions
	
	var q = questions[current_question_index]
	current_question_index += 1
	
	return {
		"text": q[0],
		"answers": q[1],
		"correct": q[2]
	}

func reset():
	current_question_index = 0

func has_more_questions():
	return current_question_index < questions.size()

func get_total_questions():
	return questions.size()

func get_current_index():
	return current_question_index
