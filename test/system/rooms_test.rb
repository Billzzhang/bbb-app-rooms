# frozen_string_literal: true

#  BigBlueButton open source conferencing system - http://www.bigbluebutton.org/.
#
#  Copyright (c) 2018 BigBlueButton Inc. and by respective authors (see below).
#
#  This program is free software; you can redistribute it and/or modify it under the
#  terms of the GNU Lesser General Public License as published by the Free Software
#  Foundation; either version 3.0 of the License, or (at your option) any later
#  version.
#
#  BigBlueButton is distributed in the hope that it will be useful, but WITHOUT ANY
#  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
#  PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
#
#  You should have received a copy of the GNU Lesser General Public License along
#  with BigBlueButton; if not, see <http://www.gnu.org/licenses/>.

require 'application_system_test_case'

class RoomsTest < ApplicationSystemTestCase
  setup do
    @room = rooms(:one)
  end

  test 'visiting the index' do
    visit rooms_url
    assert_selector 'h1', text: 'Rooms'
  end

  test 'creating a Room' do
    visit rooms_url
    click_on 'New Room'

    fill_in 'All Moderators', with: @room.all_moderators
    fill_in 'Description', with: @room.description
    fill_in 'Moderator', with: @room.moderator
    fill_in 'Name', with: @room.name
    fill_in 'Recording', with: @room.recording
    fill_in 'Viewer', with: @room.viewer
    fill_in 'Wait Moderator', with: @room.wait_moderator
    fill_in 'Welcome', with: @room.welcome
    click_on 'Create Room'

    assert_text 'Room was successfully created'
    click_on 'Back'
  end

  test 'updating a Room' do
    visit rooms_url
    click_on 'Edit', match: :first

    fill_in 'All Moderators', with: @room.all_moderators
    fill_in 'Description', with: @room.description
    fill_in 'Moderator', with: @room.moderator
    fill_in 'Name', with: @room.name
    fill_in 'Recording', with: @room.recording
    fill_in 'Viewer', with: @room.viewer
    fill_in 'Wait Moderator', with: @room.wait_moderator
    fill_in 'Welcome', with: @room.welcome
    click_on 'Update Room'

    assert_text 'Room was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Room' do
    visit rooms_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Room was successfully destroyed'
  end
end
