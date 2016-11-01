/* eslint-env jasmine */

exports.defineAutoTests = function () {
  describe('LaunchScreen', function () {
    it('launchscreen.spec.1 should exist', function () {
      expect(window.LaunchScreen).toBeDefined()
    })

    it('launchscreen.spec.2 should have show|hide methods', function () {
      expect(window.LaunchScreen.show).toBeDefined()
      expect(typeof window.LaunchScreen.show).toBe('function')

      expect(window.LaunchScreen.hide).toBeDefined()
      expect(typeof window.LaunchScreen.hide).toBe('function')
    })
  })
}
