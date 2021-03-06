#include <memory>
using namespace std;

struct node;
typedef shared_ptr<node> node_ptr;

struct node
{
	node_ptr next;
};

// TOOD: write detect_loop

#define BOOST_TEST_DYN_LINK
#define BOOST_TEST_MODULE solution
#include <boost/test/unit_test.hpp>

BOOST_AUTO_TEST_CASE(detect_loop_empty)
{
	BOOST_CHECK_EQUAL(detect_loop(node_ptr()), node_ptr());
}

BOOST_AUTO_TEST_CASE(detect_loop_one_node_none)
{
	BOOST_CHECK_EQUAL(detect_loop(node_ptr(new node)), node_ptr());
}

BOOST_AUTO_TEST_CASE(detect_loop_two_node_none)
{
	BOOST_CHECK_EQUAL(detect_loop(node_ptr{ new node { node_ptr { new node } } }), node_ptr());
}

BOOST_AUTO_TEST_CASE(detect_loop_one_node)
{
	node_ptr n(new node);
	n->next = n;
	BOOST_CHECK_EQUAL(detect_loop(n), n);
}

BOOST_AUTO_TEST_CASE(detect_loop_two_nodes)
{
	node_ptr n { new node { node_ptr { new node {} } } };
	n->next->next = n;
	BOOST_CHECK_EQUAL(detect_loop(n), n);
}

BOOST_AUTO_TEST_CASE(detect_loop_two_nodes_second)
{
	node_ptr n { new node { node_ptr { new node {} } } };
	n->next->next = n->next;
	BOOST_CHECK_EQUAL(detect_loop(n), n->next);
}

BOOST_AUTO_TEST_CASE(detect_loop_three_nodes_second)
{
	node_ptr n { new node { node_ptr { new node { node_ptr { new node{} } } } } };
	n->next->next->next = n->next;
	BOOST_CHECK_EQUAL(detect_loop(n), n->next);
}

