require 'rails_helper'

describe CommentsController, type: :controller do
  let(:user) { create(:user, :confirmed) }

  before do
    allow(request.env['warden']).to receive(:authenticate!).and_return(user)
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe 'POST #create' do
    describe 'post comment' do
      let(:site_post) { create(:post, user: user) }

      it 'with valid attributes saves the new comment in the database' do
        post :create, params: {
                        comment: { comment: 'Neat words'},
                        commentable_type: 'Post',
                        commentable_id: site_post.id,
                      }, format: 'js'
        expect(Comment.count).to eq(1)
      end

      it 'with invalid attributes does not save the new comment in the database' do
        post :create, params: {
                        comment: { comment: ''},
                        commentable_type: 'Post',
                        commentable_id: site_post.id,
                      }, format: 'js'
        expect(Comment.count).to eq(0)
      end
    end

    describe 'event comment' do
      let(:event) { create(:event, user: user) }

      it 'with valid attributes saves the new comment in the database' do
        post :create, params: {
                        comment: { comment: 'Neat words'},
                        commentable_type: 'Event',
                        commentable_id: event.id,
                      }, format: 'js'
        expect(Comment.count).to eq(1)
      end

      it 'with invalid attributes does not save the new comment in the database' do
        post :create, params: {
                        comment: { comment: ''},
                        commentable_type: 'Event',
                        commentable_id: event.id,
                      }, format: 'js'
        expect(Comment.count).to eq(0)
      end
    end
  end

  describe 'DELETE #destroy' do
    describe 'post comment' do
      let(:site_post) { create(:post, user: user) }
      let(:comment) { create(:comment, commentable_type: site_post.class.to_s,
                                       commentable_id: site_post.id,
                                       user: user) }

      it 'deletes the comment from the database' do
        delete :destroy, params: {
                           id: comment.id,
                           commentable_type: 'Post',
                           commentable_id: site_post.id,
                         }, format: 'js'
        expect(Comment.count).to eq(0)
      end
    end

    describe 'event comment' do
      let(:event) { create(:event, user: user) }
      let(:comment) { create(:comment, commentable_type: event.class.to_s,
                                       commentable_id: event.id,
                                       user: user) }

      it 'deletes the comment from the database' do
        delete :destroy, params: {
                           id: comment.id,
                           commentable_type: 'Event',
                           commentable_id: event.id,
                         }, format: 'js'
        expect(Comment.count).to eq(0)
      end
    end
  end
end
