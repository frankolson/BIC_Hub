require 'rails_helper'

describe LikesController, type: :controller do
  let(:user) { create(:user, :confirmed) }

  before do
    allow(request.env['warden']).to receive(:authenticate!).and_return(user)
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe 'POST #create' do
    describe 'post like' do
      let(:site_post) { create(:post, user: user) }

      it 'adds a like to the post' do
        post :create, params: {
                        likeable_type: 'Post',
                        likeable_id: site_post.id,
                      }, format: 'js'
        site_post.reload
        expect(site_post.cached_votes_up).to eq(1)
      end
    end

    describe 'event like' do
      let(:event) { create(:event, user: user) }

      it 'adds a like to the event' do
        post :create, params: {
                        likeable_type: 'Event',
                        likeable_id: event.id,
                      }, format: 'js'
        event.reload
        expect(event.cached_votes_up).to eq(1)
      end
    end
  end

  describe 'DELETE #destroy' do
    describe 'post like' do
      let(:site_post) { create(:post, user: user) }

      before do
        site_post.liked_by user
      end

      it 'removes the user\'s previous like from the post' do
        delete :destroy, params: {
                           likeable_type: 'Post',
                           likeable_id: site_post.id,
                         }, format: 'js'
        site_post.reload
        expect(site_post.cached_votes_up).to eq(0)
      end
    end

    describe 'event like' do
      let(:event) { create(:event, user: user) }

      before do
        event.liked_by user
      end

      it 'removes the user\'s previous like from the post' do
        delete :destroy, params: {
                           likeable_type: 'Event',
                           likeable_id: event.id,
                         }, format: 'js'
        event.reload
        expect(event.cached_votes_up).to eq(0)
      end
    end
  end
end
