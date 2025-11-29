var questions = [
	[
		"What is the balance factor of an AVL node?",
		["height(right) – height(left)", "height(left) + height(right)", "height(left) – height(right)", "abs(height(left) – height(right))"],
		2
	],
	[
		"What must the balance factor of any AVL node always satisfy?",
		["Must be exactly 0", "Must be ≤ −2", "Must be in the range [−1, 1]", "Must be positive"],
		2
	],
	[
		"A Left-Left (LL) imbalance is fixed using which rotation?",
		["Left rotation", "Right rotation", "Left-Right rotation", "Right-Left rotation"],
		1
	],
	[
		"A Right-Right (RR) imbalance is fixed using which rotation?",
		["Left rotation", "Right rotation", "Left-Right rotation", "Right-Left rotation"],
		0
	],
	[
		"A Left-Right (LR) imbalance requires:",
		["A single left rotation", "A single right rotation", "Left rotation on parent only", "Left rotation on child, then right rotation on parent"],
		3
	],
	[
		"A Right-Left (RL) imbalance requires:",
		["Right rotation only", "Left rotation only", "Right rotation on child, then left rotation on parent", "Left rotation on child, then right rotation on parent"],
		2
	],
	[
		"After a rotation, what must be updated?",
		["Only the root pointer", "Only subtree pointers", "Heights of affected nodes", "Nothing must be updated"],
		2
	],
	[
		"What should getHeight(nullptr) return in an AVL tree?",
		["0", "1", "−1", "It should throw an error"],
		2
	],
	[
		"Why do we use getHeight(nullptr) = -1?",
		["To make leaf nodes negative", "To force rotations more often", "So leaf nodes naturally compute to height 0", "Because it's required by BST rules"],
		2
	],
	[
		"When should you compute rotations during insertion?",
		["Before recursing", "Before inserting the node", "After returning from recursive calls on children", "Only when inserting at the root"],
		2
	],
	[
		"What condition triggers an AVL rotation?",
		["Duplicate key inserted", "Height difference becomes exactly 0", "Balance factor < −1 or > +1", "Every time a new node is added"],
		2
	],
	[
		"Here is a tree imbalance. What type is it?\n      30\n      /\n    20\n      \\\n       25",
		["LL", "LR", "RL", "RR"],
		1
	],
	[
		"What is the correct rotation sequence for that LR case above?",
		["Right rotation", "Left rotation", "Left rotation on child, then right rotation on parent", "Right rotation on child, then left rotation on parent"],
		2
	],
	[
		"In what order are operations done during a rotation?",
		["Rotate, then update heights", "Update heights, then rotate", "Compute balance, then return", "Copy node data, then rotate"],
		0
	],
	[
		"Why do AVL trees perform rotations at all?",
		["To prevent inserting duplicates", "To shorten code paths", "To keep depth O(log n)", "To avoid segmentation faults"],
		2
	],
	[
		"What must happen after deleting a node in an AVL tree?",
		["Nothing (AVL deletions don't affect balance)", "Heights and balances must be recomputed up the tree", "Root must be replaced", "All nodes must be reinserted"],
		1
	],
	[
		"A left rotation does what?",
		["Promotes left child", "Promotes right child", "Deletes parent", "Swaps only height values"],
		1
	],
	[
		"In a Right-Right imbalance, which side is heavy?",
		["Left subtree", "Right subtree", "Both sides", "Neither"],
		1
	],
	[
		"Which describes a proper LR rotation?",
		["Right rotate root → Right rotate child", "Left rotate root → Left rotate child", "Left rotate left child → Right rotate root", "Right rotate right child → Left rotate root"],
		2
	],
	[
		"What happens if you forget to update node heights after rotation?",
		["The tree still works", "Future balance factors will be wrong", "Insertions will be faster", "Nodes will be deleted accidentally"],
		1
	],
	[
		"Which sorting method works by repeatedly swapping adjacent elements if out of order?",
		["Bubble Sort", "Merge Sort", "Insertion Sort", "QuickSort"],
		0
	],
	[
		"Which sorting algorithm is stable?",
		["QuickSort", "Selection Sort", "Merge Sort", "Heap Sort"],
		2
	],
	[
		"What is the worst-case time complexity of QuickSort?",
		["O(n log n)", "O(n)", "O(log n)", "O(n²)"],
		3
	],
	[
		"What is the time complexity of Merge Sort?",
		["O(n)", "O(n log n)", "O(log n)", "O(n²)"],
		1
	],
	[
		"What is a load factor?",
		["Total memory used", "Number of collisions", "size / capacity", "height of BST"],
		2
	],
	[
		"What happens when a hash table becomes too full (high load factor)?",
		["Search becomes faster", "Collisions increase", "Memory resets", "Hash function changes automatically"],
		1
	],
	[
		"Which method resolves collisions by chaining?",
		["Using an array", "Using a linked list at each bucket", "Resizing the table", "Rehashing"],
		1
	],
	[
		"What causes collisions in a hash table?",
		["Too much memory", "Two keys hash to the same index", "Hash function fails", "Keys too similar"],
		1
	],
	[
		"What is the average time complexity of searching in a hash map?",
		["O(1)", "O(log n)", "O(n)", "O(n log n)"],
		0
	],
	[
		"Deleting a node with two children requires replacing it with:",
		["A null pointer", "The largest node in the left subtree", "The smallest node in the right subtree, or the largest in the left subtree", "Any leaf"],
		2
	],
	[
		"How many children can a binary tree node have at most?",
		["1", "2", "3", "Unlimited"],
		1
	],
	[
		"What traversal prints values in sorted order for a BST?",
		["Preorder", "Postorder", "Inorder", "Level order"],
		2
	],
	[
		"What is the worst-case find of a BST?",
		["O(1)", "O(log n)", "O(n)", "O(n²)"],
		2
	],
	[
		"What is a disadvantage of arrays?",
		["They have slow access times", "They cannot store integers", "Fixed size", "Use too much memory"],
		2
	],
	[
		"What happens when an array is full and you try to append an element?",
		["It crashes", "It creates a linked list", "A bigger array must be allocated", "The new element overwrites an old one"],
		2
	],
	[
		"What is the time complexity of searching for an element in an unsorted linked list?",
		["O(log n)", "O(1)", "O(n)", "O(n log n)"],
		2
	],
	[
		"In a doubly linked list, what does each node store?",
		["Only data", "Data + 1 pointer", "Data + 2 pointers", "Data + 3 pointers"],
		2
	],
	[
		"What is the main disadvantage of a linked list compared to an array?",
		["Slow search times", "Limited size", "Cannot insert", "Cannot delete"],
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
