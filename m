Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010047.outbound.protection.outlook.com [52.101.46.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3BC2EEE8C
	for <dmaengine@vger.kernel.org>; Tue, 18 Aug 2026 03:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787023920; cv=fail; b=OsqqMWBaheYK3g6k0kpTZlLSbLHxtvq2x5nhxqySVkiSRYrfNwGD9UsYJ4CHrEnhF8owA1RrxbMqqASEZPaU2oUiVUE1NlnRWO6RvB2tHFf0ZAwO47GHJZejWz3nBmRxGTqzJjVHtSPEDwQSUI/xgy8docMEgN7hW0HcgD6TyRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787023920; c=relaxed/simple;
	bh=kDuRW4na38ujbhh8Ysn1WXcUMUDHszCcX9ob2aJIZcs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IkayMERcaAAWd1teJo2h3EB5zhwnh5rJYgIKMAWfbiocyjoqZjThZ+MEDrvExqh9q8AiF/2TyGW6Ib1fVzPv0ylCO65Ufs7jUVa3Qdi/AJ2j+JVh/ShGLOLDa5YNdQrK0QyYFMB1ELNErS0ys0b2MLVQ7s3J/SxYo4d8g6zXEB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KXgCBCgQ; arc=fail smtp.client-ip=52.101.46.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KXgCBCgQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ayRUdtosXPzEAI9RDrBbxeKfz2ZBXyH3/Qv9J3N5FXeiRXDRQVtAsILMF3CFVJ/lGuo330yOcHEGuyIoEN8dR71FQnJd5+jRKaZ2jmy8YOS90Pqeoa/PzBBQOadgnWs0NJcu3tG0swfsvDoPBBuu/AL0dX99/huKaya8txUNmScXBDJfo8AgQQl9P9bDIi5ZLZVhis/fE/czqqFQZNG+CggqWskj4F1mL31KjMJtGuKVh9SaiGUz5ZMG4KL1Xbhfcbk3EvqmTDx5vUx3L1xfaeC48eeMqsswxKAAvJGhYR/WkzqMxXJIf9v7CpsMsXRLcaUyEphJl1NgyAYPppZ4Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kDuRW4na38ujbhh8Ysn1WXcUMUDHszCcX9ob2aJIZcs=;
 b=g99L2IOUYExhZw1ck2glSQKoSq60DlQBJZ+0GgsOhXzE2n5aqTryDWo4fLe3a2u+G9wpXpLaRntr6wN8qgRdmScLB/Ygg7vQOkmkHj9J8n6LexaqTEGPZHj0Q4HbmjLezFJ3wRzvaDH4TXYK1d02MnQW0e+zReBi6c/pwh7g8QmDDw5uoaQ6kf98vScuo1QOJ2ol8BP6NfitS0OE5mi3ZWJsZH8ydWI53FnT9Fg5Thg1T7v6AWmJCzsFX+EFTJ8jaVkZkkkw9KuE30tB4etPScB6VilrYEjZojtAtK3FfXJq77We9hMJ5H0JktrmqJOOPKIS1w2x8uy8pM8dzlRCwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDuRW4na38ujbhh8Ysn1WXcUMUDHszCcX9ob2aJIZcs=;
 b=KXgCBCgQjVEbwNK9bMfToPa4gl9JOc8kDplhej4aJT5njbMsmXuoi/ZE78s0owgxBxSCskpYwYzTzU3wvK030/k8gPK5iEIU1RJ0IABpppcucGyXo9E9duNYujXgK3pfWg4PNTJM2i7ZjEuaz5DurgMUSzqqvyt4R4SFrU48TGE=
Received: from BN9PR12MB5259.namprd12.prod.outlook.com (2603:10b6:408:100::17)
 by CY5PR12MB6298.namprd12.prod.outlook.com (2603:10b6:930:21::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 03:31:56 +0000
Received: from BN9PR12MB5259.namprd12.prod.outlook.com
 ([fe80::122c:cca7:c2b3:90ed]) by BN9PR12MB5259.namprd12.prod.outlook.com
 ([fe80::122c:cca7:c2b3:90ed%2]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 03:31:56 +0000
From: "Garg, Shivank" <shivankg@amd.com>
To: "Frank.li@oss.nxp.com" <Frank.li@oss.nxp.com>
CC: "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
	"sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"vkoul@kernel.org" <vkoul@kernel.org>, "Frank.Li@kernel.org"
	<Frank.Li@kernel.org>
Subject: Re: [PATCH v3 2/3] dmaengine: fix use-after-free in dma_chan_put()
 and dma_release_channel()
Thread-Topic: [PATCH v3 2/3] dmaengine: fix use-after-free in dma_chan_put()
 and dma_release_channel()
Thread-Index: AQHdLZbdwO0W0TsJdkqEWxJL4OZzDbag13WAgAAg/ICAAVUkAIAA23aA
Date: Tue, 18 Aug 2026 03:31:55 +0000
Message-ID: <cebb696c95f6edb0d7a04eb29dd624638ec4822f.camel@amd.com>
References: <20260816-dmaengine-kref-fix-v3-0-7e76187145df@amd.com>
	 <20260816-dmaengine-kref-fix-v3-2-7e76187145df@amd.com>
	 <20260816160722.26C811F000E9@smtp.kernel.org>
	 <ba6d6fc86076b4f2e5244cad3c5c70d782dff74a.camel@amd.com>
	 <aoMaEEOgQhZduJoe@SMW015318>
In-Reply-To: <aoMaEEOgQhZduJoe@SMW015318>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5259:EE_|CY5PR12MB6298:EE_
x-ms-office365-filtering-correlation-id: 7ad855bf-03ab-4885-9df5-08defcd940e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|13003099007|38070700021|6133799003|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info:
 JNkoHZ+sx0znjFAFgRrQonc5EX1eOTRiOnuokiBqQ70/pfJGOkVNXioirqfwiRf5PLFbaL4YoY99u5OlCu0e6IcpMhifrFveroGBDKpo83sDsfYkKfc5uY6WQ3QLOpFPFBV7zB3Xf8TP1aTZQmQ97xhQ222xNhxteCz6ViYnBM/Du1RuqohkMih0fa7FT/vd+QexWWYg7HBM0XRrqEYnRq4EI/sgM4Njpzy51ZK1SWAwSO9s8kyG7tUk6gymjMvjf8g0yYG+lB6Qt5q5F3pk2J6eCl91l+JTW0Iki/gvjKFSDY9f+Ecqi+Mk61Xs34Fn+zEvjwfkxlVsIMA5TDDykRuJwIrNR2FIcKWZyicOD4XF3jAWookMBuIGa8j2DezhMJVdkXcFXumcdFr2edt0/qJIIiyUanyNgJp0nLEJ0Ofq7zaKQEVCnImwNLxsO81Kq3+ubGiPJ+gWiTnsNZxSqiHqnA0avSIe9zJL10kyBrwO26khpqnXKWGs/pt3LA0oKYxl/zLSeFC6DgjiGWGx9MMh+OgIYEuIM7ZR9KTYIsihSry/bI8atkngxPbG5aLpUdU3RUWo3TLmLx2QeloXh1CrX0ui4cr04a7bVBiKVAqSPd1fdENym99FLJC4v81ypmgVnS5/LwZuEguCGN5viF6/7XLkxV7aIXhrWe1IwII=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5259.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(13003099007)(38070700021)(6133799003)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eVB3V2dLcHF2MlMyU2crZE9ydkNXeHNLeXRVU2J1RjZFUCt1TC8vbkphZ0Fn?=
 =?utf-8?B?MzRtb2k0L3I5dFg2dmFCSnVrYmVJSXZ6NTFYRy8yNHRSekpiQlVRS2FqdFFq?=
 =?utf-8?B?REVSY0lKK1B4SnhHdGE2Y0ExZTBlL3lEK2JMT1FFNm14V1FIZEUwdjZScFNF?=
 =?utf-8?B?c3NDdGZuakdZUXQ4Vi9peTQzVlR4U2ZpMzZoT1hBbWcyTEVDcEE0WHZzWHlu?=
 =?utf-8?B?ZWVNQlh3a24yZUN6VmNZdWx4VjlVRTNxQ0dXQVpxL1owVURCZ3hBZTRlNTho?=
 =?utf-8?B?M1RWTlJUL2hXbmlHRnB2SkVOVTlhY21lenZHOHM5YW9OQUVVRE1KMlA0djh2?=
 =?utf-8?B?NnZIaHlUcXFNRmFLazduRjY5ODJFekt4S2ZiRjBMWW1qU3RqVWUweDN3bGlS?=
 =?utf-8?B?MnBTc0tCRkJpcmN0VWlzZmFvMDNmRUxiNHpjRCtMR0V6RGNhTUowbmxFNXZE?=
 =?utf-8?B?R2hNTGRlQnRON21rbUpqTW5weUROMlJpbkQwN2Q5MFBjWHRHbDFOUUhNOTBs?=
 =?utf-8?B?dDNyWjUwTEpPemxoRC9HTzcwZHlyRnFxclZPRXlCdWFGRlN6YkhTRklSaGxx?=
 =?utf-8?B?UjhzeFB1ajlpdjRxcTk1OUovK0Z6YkpEL3N5Nzh6amVzVjEvMUJ0NWwremc4?=
 =?utf-8?B?aGorSVIvejU3SWhVN0FoVHBGZWR1dVowVFhFSGpqeFdPVlptMFhjemtiUDl4?=
 =?utf-8?B?OUJGQ3lRdUhLRlladmpHazR5TGx5bXNIRVFUcHJoazcyS2FzNmVrcXJ2aHpi?=
 =?utf-8?B?T1haS0wyUE1MakRZMXRFRGZnSWprWlI1dENlT1RBcmJuaTlWQXFsa2FPaGU1?=
 =?utf-8?B?SGY1aDB4WFRMUmtlYy9BSE8wMGt0R28veGVCT3hMUTlaYlZvclMwRmxsQ3o0?=
 =?utf-8?B?Sy9RNEU2TmJhQzhObmkxaGt6TzFkWkp5ekUyK2l6YXl1blVCS1U2bkhtQWlx?=
 =?utf-8?B?WUtjWGQvN0c3bjlyTGZiOXo0U2p4TWRFdU9TTkhOTnhwdDhXdVJhWG9kZWNn?=
 =?utf-8?B?WjdrSy8yWVorV2l0QU5zUWJUYTlQcmg5dGRIQW14eVRvWE16MTFDeFlmQmxF?=
 =?utf-8?B?ZGt1dkE5K1ZaTlMvUkJjR0xwMFdocXhKN0UzL3NpODAwMnA5NDhYQ1A2VXFI?=
 =?utf-8?B?WlJUVmxaekoyQWZ1M2ZJMWRuSHNjMSs0WEo5Y0JHNDNnWlNZZHlnVWtTOHVI?=
 =?utf-8?B?ZjhrUzEyc09jeXpGRzBEOUh1L1pleGY3NUpwYUppTTZ4NTF2Z0dyMGx1NE9p?=
 =?utf-8?B?RTB3TGlvQ2plQTBQYmhvVE1wTHMrdjZHMzJrYzBrcjB6dXFHTnV1YThDalRH?=
 =?utf-8?B?enpaNGl2MGw1L0l5MXd5L3hqbjRjNmQwYmxlM3MvcEhZOWF1NndCL2RUeUVJ?=
 =?utf-8?B?bisvNEoreFl6cFkwWWl4VVVZV2RUSGhWa1YydEw1MWtHaHNsQVNRbFVxeVJU?=
 =?utf-8?B?OEV5TlBSQUlVMnhGNEpzQ0dIUzU2d0lMTWxQdlpQTVRXczFkUjdETmJaL2Jm?=
 =?utf-8?B?SjBTYnI3cS9odGZPY0wrZjNNQ2JmcXRqUnpZS3E5YjU2dC9MeXBtb0NwR1VR?=
 =?utf-8?B?ZDFCOFBWc2xvd2g1ME5sN25ySXVzWENFL1RDa3ZtS1BGZmVWMXJXOG9XV09T?=
 =?utf-8?B?V1dUaWFzTTN1T2s0TzBSNUZIMm1kT3FyTEhmUkU4TjZuYnpoYUlyRFViR3Rt?=
 =?utf-8?B?elBGa2MvcjBvL0g3VmVSamhmSGYwTXZUd2M3S1puMVRHWEZ4S2x0d1hTejRD?=
 =?utf-8?B?Yk9FNHhmWHpCbzhhMTFVUDM0MHNqNGwrN3BkMVdYOFlYb0xLR2w3VmlIaVhS?=
 =?utf-8?B?RnUvUHN4VVZFTjdTZE5OT1Bpa3BUTFBXSEs5aURzdnYvSXdrVVFRcXRWNFlI?=
 =?utf-8?B?ai9xaDZwdTJnTVo5ZFRvUTdzOFEvNkhhR0tjWHNBdG9qYWZkSjBoQTlrd0c0?=
 =?utf-8?B?am9qWC9jTDZPWjUrSytDUXJycWU3UGVqNE5WbGFtZGliZlNralE0RmxIcDJj?=
 =?utf-8?B?STB0UWIyQ3RRWmIrNUNGR2ZNeUt1OGxmUXplT2NqTXhwY1o4a0JXUi9LbEdw?=
 =?utf-8?B?R3NCVXVEcmtqaUxTL3NWcTF2Y3dDQ01maFlta1BUWUZFTWYyM0REL0dHcS96?=
 =?utf-8?B?TEpRWHJ1T3hJaVovODBpQkh6TjNxTnM2QjNBdHFJS3BoYnFOQWJGSGxTSnla?=
 =?utf-8?B?TEEvSXVpOXlpMHNkTjJRd1hlQ1Nzdi90akNuY0xPL05wd1ZrNHpjRWhvQ1pl?=
 =?utf-8?B?K2FPT3FaSm1FUjJ3bm80cW8vdmVKNGRzOGU4dDI4S3RhblUxWGVKRDBXaVdS?=
 =?utf-8?B?MTd0blI2V2loSlNJNEVVRUsyU2V1dkxuQzBlRS9uemFEYmlSWFZndz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ED031ED1DBFA98419E1DE0ADA9886424@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5259.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ad855bf-03ab-4885-9df5-08defcd940e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2026 03:31:55.9119
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gmw+MoG7sVknF2mIsILrVHNuPBL1xG+z+WgKm12Q7/vLLhYBMyURGbV+KXtCkv2L4VVKgxcjQnTU+6MdYDzuRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6298

T24gTW9uLCAyMDI2LTA4LTE3IGF0IDA5OjI2IC0wNTAwLCBGcmFuayBMaSB3cm90ZToNCj4gW1lv
dSBkb24ndCBvZnRlbiBnZXQgZW1haWwgZnJvbSBmcmFuay5saUBvc3MubnhwLmNvbS4gTGVhcm4g
d2h5IHRoaXMgaXMgaW1wb3J0YW50IGF0IGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJ
ZGVudGlmaWNhdGlvbiBdDQo+IA0KPiBPbiBTdW4sIEF1ZyAxNiwgMjAyNiBhdCAwNjowNToyN1BN
ICswMDAwLCBHYXJnLCBTaGl2YW5rIHdyb3RlOg0KPiA+IFtZb3UgZG9uJ3Qgb2Z0ZW4gZ2V0IGVt
YWlsIGZyb20gc2hpdmFua2dAYW1kLmNvbS4gTGVhcm4gd2h5IHRoaXMgaXMgaW1wb3J0YW50IGF0
IGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlvbiBdDQo+ID4gDQo+
ID4gT24gU3VuLCAyMDI2LTA4LTE2IGF0IDE2OjA3ICswMDAwLCBzYXNoaWtvLWJvdEBrZXJuZWwu
b3JnIHdyb3RlOg0KPiA+ID4gVGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlr
byBBSSByZXZpZXcgZm91bmQgMSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6DQo+ID4g
PiAtIFtIaWdoXSBDbGVhcmluZyBgY2hhbi0+c2xhdmVgIGJlZm9yZSBzdG9wcGluZyB0aGUgaGFy
ZHdhcmUgaW50cm9kdWNlcyBhIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSBpbiBgc3RtMzJfZG1h
M19wbV9zdXNwZW5kKClgLg0KPiA+ID4gLS0NCj4gPiA+IA0KPiA+ID4gLS0tIFBhdGNoIFsyXTog
W1BBVENIIHYzIDIvM10gZG1hZW5naW5lOiBmaXggdXNlLWFmdGVyLWZyZWUgaW4gZG1hX2NoYW5f
cHV0KCkgYW5kIGRtYV9yZWxlYXNlX2NoYW5uZWwoKSAtLS0NCj4gPiA+IGNvbW1pdCBjMGJjYTYw
ZGM2OTc3Y2NhNzM1MmJhY2QxMDk1MDgxZDg5Yzg4MjExDQo+ID4gPiBBdXRob3I6IFNoaXZhbmsg
R2FyZyA8c2hpdmFua2dAYW1kLmNvbT4NCj4gPiA+IA0KPiA+ID4gZG1hZW5naW5lOiBmaXggdXNl
LWFmdGVyLWZyZWUgaW4gZG1hX2NoYW5fcHV0KCkgYW5kIGRtYV9yZWxlYXNlX2NoYW5uZWwoKQ0K
PiA+ID4gDQo+ID4gPiBXaGVuIGRtYV9kZXZpY2VfcHV0KCkgZHJvcHMgdGhlIGxhc3QgcmVmZXJl
bmNlIG9uIGNoYW4tPmRldmljZS0+cmVmLA0KPiA+ID4gZG1hX2RldmljZV9yZWxlYXNlKCkgbWF5
IGZyZWUgdGhlIGRtYV9kZXZpY2UuIFRoaXMgY29tbWl0IGNhY2hlcyB0aGUNCj4gPiA+IG1vZHVs
ZSBvd25lciBhbmQgZGVsYXlzIGRtYV9jaGFuX3B1dCgpIHRvIHByZXZlbnQgcmVhZGluZyBmcmVl
ZCBtZW1vcnkuDQo+ID4gPiANCj4gPiA+IExpbms6IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRj
aHNldC8yMDI2MDUxOC1kbWFlbmdpbmUta3JlZi1maXgtdjEtMS00ZDYxMjUwNDhmYjdAYW1kLmNv
bQ0KPiA+ID4gDQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZG1hL2RtYWVuZ2luZS5jDQo+ID4gPiA+
ICsrKyBiL2RyaXZlcnMvZG1hL2RtYWVuZ2luZS5jDQo+ID4gPiA+IEBAIC05MTYsOCArOTE5LDYg
QEAgdm9pZCBkbWFfcmVsZWFzZV9jaGFubmVsKHN0cnVjdCBkbWFfY2hhbiAqY2hhbikNCj4gPiA+
ID4gICAgIGlmICgtLWNoYW4tPmRldmljZS0+cHJpdmF0ZWNudCA9PSAwKQ0KPiA+ID4gPiAgICAg
ICAgICAgICBkbWFfY2FwX2NsZWFyKERNQV9QUklWQVRFLCBjaGFuLT5kZXZpY2UtPmNhcF9tYXNr
KTsNCj4gPiA+ID4gDQo+ID4gPiA+IC0gICBkbWFfY2hhbl9wdXQoY2hhbik7DQo+ID4gPiA+IC0N
Cj4gPiA+ID4gICAgIGlmIChjaGFuLT5zbGF2ZSkgew0KPiA+ID4gPiAgICAgICAgICAgICBzeXNm
c19yZW1vdmVfbGluaygmY2hhbi0+ZGV2LT5kZXZpY2Uua29iaiwgRE1BX1NMQVZFX05BTUUpOw0K
PiA+ID4gPiAgICAgICAgICAgICBzeXNmc19yZW1vdmVfbGluaygmY2hhbi0+c2xhdmUtPmtvYmos
IGNoYW4tPm5hbWUpOw0KPiA+ID4gPiAgICAgICAgICAgICBrZnJlZShjaGFuLT5uYW1lKTsNCj4g
PiA+ID4gICAgICAgICAgICAgY2hhbi0+bmFtZSA9IE5VTEw7DQo+ID4gPiA+ICAgICAgICAgICAg
IGNoYW4tPnNsYXZlID0gTlVMTDsNCj4gPiA+ID4gICAgIH0NCj4gPiA+ID4gDQo+ID4gPiA+ICAj
aWZkZWYgQ09ORklHX0RFQlVHX0ZTDQo+ID4gPiA+ICAgICBrZnJlZShjaGFuLT5kYmdfY2xpZW50
X25hbWUpOw0KPiA+ID4gPiAgICAgY2hhbi0+ZGJnX2NsaWVudF9uYW1lID0gTlVMTDsNCj4gPiA+
ID4gICNlbmRpZg0KPiA+ID4gPiArICAgZG1hX2NoYW5fcHV0KGNoYW4pOw0KPiA+ID4gDQo+ID4g
PiBbU2V2ZXJpdHk6IEhpZ2hdDQo+ID4gPiBDb3VsZCBtb3ZpbmcgZG1hX2NoYW5fcHV0KCkgaGVy
ZSBpbnRyb2R1Y2UgYSBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UNCj4gPiA+IGR1cmluZyBzeXN0
ZW0gc3VzcGVuZD8NCj4gPiA+IA0KPiA+ID4gQnkgbW92aW5nIGRtYV9jaGFuX3B1dCgpIGFmdGVy
IHRoZSBibG9jayB0aGF0IGNsZWFycyBjaGFuLT5zbGF2ZSwgdGhlDQo+ID4gPiBoYXJkd2FyZSBj
aGFubmVsIG1heSBzdGlsbCBiZSBhY3RpdmUgd2hpbGUgY2hhbi0+c2xhdmUgaXMgTlVMTC4gSWYg
YQ0KPiA+ID4gc3lzdGVtIHN1c3BlbmQgb2NjdXJzIGNvbmN1cnJlbnRseSwgZHJpdmVycyBsaWtl
IHN0bTMyLWRtYTMgbWlnaHQgY2hlY2sNCj4gPiA+IHRoZSBoYXJkd2FyZSBzdGF0ZSBhbmQgYXR0
ZW1wdCB0byBwcmludCB0aGUgc2xhdmUgZGV2aWNlIG5hbWU6DQo+ID4gPiANCj4gPiA+IGRyaXZl
cnMvZG1hL3N0bTMyL3N0bTMyLWRtYTMuYzpzdG0zMl9kbWEzX3BtX3N1c3BlbmQoKSB7DQo+ID4g
PiAgICAgLi4uDQo+ID4gPiAgICAgICBjY3IgPSByZWFkbF9yZWxheGVkKGRkYXRhLT5iYXNlICsg
U1RNMzJfRE1BM19DQ1IoY2hhbi0+aWQpKTsNCj4gPiA+ICAgICAgIGlmIChjY3IgJiBDQ1JfRU4p
IHsNCj4gPiA+ICAgICAgICAgICAgICAgZGV2X3dhcm4oZGV2LCAiU3VzcGVuZCBpcyBwcmV2ZW50
ZWQ6ICVzIHN0aWxsIGluIHVzZSBieSAlc1xuIiwNCj4gPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgZG1hX2NoYW5fbmFtZShjKSwgZGV2X25hbWUoYy0+c2xhdmUpKTsNCj4gPiA+ICAgICAuLi4N
Cj4gPiA+IH0NCj4gPiA+IA0KPiA+ID4gU2luY2UgZG1hX2NoYW5fcHV0KCkgKHdoaWNoIHN0b3Bz
IHRoZSBoYXJkd2FyZSkgaGFzbid0IGJlZW4gY2FsbGVkIHlldCwNCj4gPiA+IENDUl9FTiB3b3Vs
ZCBzdGlsbCBiZSBhY3RpdmUsIGFuZCBkZXZfbmFtZShjLT5zbGF2ZSkgd291bGQgZGVyZWZlcmVu
Y2UNCj4gPiA+IHRoZSBOVUxMIHBvaW50ZXIgd2UganVzdCBzZXQuDQo+ID4gPiANCj4gPiA+IElz
IHRoZXJlIGEgd2F5IHRvIHN0b3AgdGhlIGNoYW5uZWwgYmVmb3JlIGNsZWFyaW5nIHRoZSBzbGF2
ZSBwb2ludGVyDQo+ID4gPiB3aXRob3V0IHRyaWdnZXJpbmcgdGhlIG9yaWdpbmFsIHVzZS1hZnRl
ci1mcmVlPw0KPiA+IA0KPiA+IFRoaXMgaXMgYSB2YWxpZCBjb25jZXJuLg0KPiA+IFNvLCBlaXRo
ZXIgd2UgY2FuIGhhdmUgYSBOVUxMIGNoZWNrIGluIHN0bTMyIGNvZGUgd2hpbGUgcHJpbnRpbmcg
ZGV2aWNlDQo+ID4gbmFtZSwgb3IgZHJvcCBkbWFfY2hhbl9wdXQoKSBjaGFuZ2UgZm9yIG5vdyB0
byBhdm9pZCB0aGlzIHRyaWdnZXI/DQo+IA0KPiBEcm9wIGRtYV9jaGFuX3B1dCgpIGZpcnN0bHku
DQo+IA0KPiBGcmFuaw0KPiANCj4gDQoNClN1cmUNCg0KVGhhbmtzLA0KU2hpdmFuaw0K
