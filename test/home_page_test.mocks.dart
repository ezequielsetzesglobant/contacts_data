import 'dart:async' as _i4;

import 'package:contacts_data/bloc/contact_bloc.dart' as _i3;
import 'package:contacts_data/model/contact.dart' as _i5;
import 'package:contacts_data/repository/interface/i_contact_repository.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

class _FakeRepositoryInterfaceContact_0 extends _i1.Fake
    implements _i2.IContactRepository {}

class MockContactBloc extends _i1.Mock implements _i3.ContactBloc {
  MockContactBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.IContactRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
              returnValue: _FakeRepositoryInterfaceContact_0())
          as _i2.IContactRepository);

  @override
  _i4.Future<void> initialize() =>
      (super.noSuchMethod(Invocation.method(#initialize, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);

  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);

  @override
  _i4.Future<List<_i5.Contact>> getContacts() =>
      (super.noSuchMethod(Invocation.method(#getContacts, []),
              returnValue: Future<List<_i5.Contact>>.value(<_i5.Contact>[]))
          as _i4.Future<List<_i5.Contact>>);
}
