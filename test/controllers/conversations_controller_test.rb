require 'test_helper'


class ConversationsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    sign_in users(:user) # Replace :your_user with the appropriate fixture or user object
    get conversations_url
    assert_response :success
  end


  test 'should create conversation' do
    post conversations_url, params: { sender_id: 1, recipient_id: 2 }
    assert_redirected_to conversation_messages_url(@controller.instance_variable_get(:@conversation))
  end

  test 'should destroy conversation' do
    conversation = conversations(:one) # Assuming you have a fixture for conversations
    delete conversation_url(conversation)
    assert_redirected_to conversations_url
  end
end
