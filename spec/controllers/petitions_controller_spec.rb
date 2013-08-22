require 'spec_helper'

describe PetitionsController do

    let(:petition) { FactoryGirl.create(:petition)}
    let(:user) { FactoryGirl.create(:user)}

    describe '#index' do 

      it 'should assign @petitions' do
        petition 
        get :index
        expect(assigns(:petitions)).to eq([petition])

      end

      it "renders the index template" do
        get :index
        expect(response).to render_template("index")
      end

    describe '#new' do

      it 'should render new page' do 
        get :new
        expect(response).to render_template("new")

      end
    end

    describe '#create' do 
      before :each do 
        @petition_hash = {
          title: 'title',
          description: 'things'
        }
        sign_in user
      end

      it 'should save to database'  do
        expect{
          post :create, petition: @petition_hash
          }.to change(Petition, :count).by(1)
      end
    end
    
    describe '#show' do

      it 'should render show' do
        get :show, id: petition.id
        expect(response).to render_template('show')
      end

      it 'should' do 
        get :show, id: petition.id
        expect(assigns(:petition)).to eq(petition)
      end
    end

    describe 'edit' do
      it 'should render edit form' do
        get :edit, id: petition.id  
        expect(response).to render_template('edit')
      end
    end

    describe 'update' do 
      before :each do
        @petition_hash = {
          title: 'title',
          description: 'description'
        }
      end 

      it 'should update a petition' do 
        put :update, id: petition.id, petition: @petition_hash 
        petition.reload
        petition.title.should == 'title'
        petition.description.should == 'description'
      end
    end

    describe 'DELETE destroy' do
  
      it "deletes the petition" do
        petition 
        expect {
        delete :destroy, id: petition        
        }.to change(Petition,:count).by(-1)
      end
    
      it "redirects to index" do
        delete :destroy, id: petition
        response.should redirect_to petitions_path
      end
    end

  end

end



