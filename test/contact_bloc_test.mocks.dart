import 'dart:async' as _i4;

import 'package:contacts_data/model/contact.dart' as _i5;
import 'package:contacts_data/service/contact_service.dart' as _i3;
import 'package:http/http.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

class _FakeClient_0 extends _i1.Fake implements _i2.Client {}

class MockServiceContact extends _i1.Mock implements _i3.ContactService {
  MockServiceContact() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Client get client => (super.noSuchMethod(Invocation.getter(#client),
      returnValue: _FakeClient_0()) as _i2.Client);

  @override
  set client(_i2.Client? _client) =>
      super.noSuchMethod(Invocation.setter(#client, _client),
          returnValueForMissingStub: null);

  @override
  _i4.Future<List<_i5.Contact>> getContacts() =>
      (super.noSuchMethod(Invocation.method(#getContacts, []),
              returnValue: Future<List<_i5.Contact>>.value(<_i5.Contact>[]))
          as _i4.Future<List<_i5.Contact>>);
}
