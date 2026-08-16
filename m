Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013003.outbound.protection.outlook.com [40.93.201.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E016B184540
	for <dmaengine@vger.kernel.org>; Sun, 16 Aug 2026 18:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786904060; cv=fail; b=RllRBzktNGUrf5LSXnyogC3ElkDLrU7pPEOV29aX5frGGQabq0FpWuYfaJMW9vlwOJ/0xSlsOB1PQ1Zq8t1VK74XyoqNVsc78oFYAH4+PDQ+Ytx4QvNQINfvU6q26RcHuOqIdZ72IUKaAHPR+cnw8f7PoydbqZsbVWqHB/i0p9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786904060; c=relaxed/simple;
	bh=W+PRPbL+Idcs/S/iIf+Zju6IoRD15Be41Tlud0MEdXc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Bm1mJAOhczWtWmmSY18rCZAaMlVHVmFQ1ifvyF2vTT5YcRclfd9ev4UCrLBq5x1Gu4b10VrqdBxcFBWUQ3/Kra1NTDmonuny2DIEkGhqva/GaEA4uZEAIoceqp61CkN3Aj+7lUIccqt1JW/TAPwpnS3OBMCDb0YArxDWPp8tH3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZPLPxJv6; arc=fail smtp.client-ip=40.93.201.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZPLPxJv6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KuIZ7mjxDdPGUfpY52D1V0HoCAWjOBh/LlR5YgmkuA+py90e0r4GFg5mU0AqfM6r4vCSSGEnqszzQdS20H659oEKq+bIDwFArLoRRGOU8YrNS9LMk0P1GJ2eFa/9xb719/P+vb+piPDufx3XChFQHJa9Zc8ctvzV8SAGsLAGFJZ68yGotAekHbQP9hVw9cOC8fhcuX6AUrW2/oOsjE0NIWUumEaUfIIloqf+T0UP1cPqRULM4TrlMGMY/a66jtMkso9DDPR5etvnFxyM73gHDyKx/v0H5jMwJHjXI+4Nli9zn+WZzKBrDZb7tKtjo32w44En/P4n0diaI3czo5vhHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+PRPbL+Idcs/S/iIf+Zju6IoRD15Be41Tlud0MEdXc=;
 b=WekpMVTFRJJU5DdCG6TPsSQw2j7ca3p8D86EeiIUyt7+TX6XEO9nKHS/FW72znCLPAo23L2Bha6mc4RZXoY0c6rqWKU8PwqKhjNU9qJUh7aEnfB7bFeSAN5rbkyK4LEZ1DT9hd1/yjSb9cvqQbz6IZ0o2Co1VLxS7Yg5EbAPLLoXfc/NdeE10HBh/hXJMkL28IiHVGHfYBbgyZey+/OY0BwyG+q4IzRpRS8rhXqrd4NJRlld47vIXL9jsXAH/poy/u4KSfNmeHGanK+dmoENdSjHNSWjjfI6Pg9sb1+pCm+JnEKwLVfzyYF4/aZJ7sz/KV/JqrVYMfAFmL5j9ruSVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+PRPbL+Idcs/S/iIf+Zju6IoRD15Be41Tlud0MEdXc=;
 b=ZPLPxJv6xUuGX8jRTDWZBnAF3m4UjRdZjtuLRGY62ImImHGyo8adUUo4eZOMDwTT9T4Uj24br6MDwNegQ/qYPimvn0wXQeqo5zbwyf0E/HBtJxBoR+qyeTR8NbCZUablgzqxipqa0DlwdH0CWhHCWeuAufosPbtNMf+VlurT8/k=
Received: from BN9PR12MB5259.namprd12.prod.outlook.com (2603:10b6:408:100::17)
 by MW4PR12MB7142.namprd12.prod.outlook.com (2603:10b6:303:220::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Sun, 16 Aug
 2026 18:14:15 +0000
Received: from BN9PR12MB5259.namprd12.prod.outlook.com
 ([fe80::122c:cca7:c2b3:90ed]) by BN9PR12MB5259.namprd12.prod.outlook.com
 ([fe80::122c:cca7:c2b3:90ed%2]) with mapi id 15.21.0315.016; Sun, 16 Aug 2026
 18:14:15 +0000
From: "Garg, Shivank" <shivankg@amd.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
	"vkoul@kernel.org" <vkoul@kernel.org>, "Frank.Li@kernel.org"
	<Frank.Li@kernel.org>
Subject: Re: [PATCH v3 1/3] dmaengine: Fix device kref underflow in
 dma_chan_put()
Thread-Topic: [PATCH v3 1/3] dmaengine: Fix device kref underflow in
 dma_chan_put()
Thread-Index: AQHdLZbbfcMa6B7h+UWLPdZnPL6P3Lag1hwAgAAkygA=
Date: Sun, 16 Aug 2026 18:14:15 +0000
Message-ID: <8c73f392307e39f822bc4bad9f4b1ea148941ea6.camel@amd.com>
References: <20260816-dmaengine-kref-fix-v3-0-7e76187145df@amd.com>
	 <20260816-dmaengine-kref-fix-v3-1-7e76187145df@amd.com>
	 <20260816160233.0A1E41F000E9@smtp.kernel.org>
In-Reply-To: <20260816160233.0A1E41F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5259:EE_|MW4PR12MB7142:EE_
x-ms-office365-filtering-correlation-id: 3c2552e8-0106-4363-eea7-08defbc22e3d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|6133799003|38070700021|18002099003|22082099003|56012099006|10067099003|4143699003|11063799006;
x-microsoft-antispam-message-info:
 Q4Kz6PaLkd3yRChiEaH3MdMP14M1EX0g+4tGaaRQTAy9UQ6HCJVQbj+J+Oyoa2daa5j47pKlc9g/PfzRi9D/DGVD2N3ivUP2TnDYwjKmdt9pEoT4RXxMIzH+a16vlNtlSK+kofAQqBP4Ds+uJZisCEGE58cO5SmpMoAd4ufo2VLWgthbz9KpCpRz+ZZlzzVOBF5raBaHOmejOZvXci1Igw+shspA7WEm7cUJTH6YfmkypIwx2rGmTFo5VoqAIChqldyHKWUtEJilpWsxetYVi5pw6hxo7sCHBuYO8Pf1NF4wscKyMMotQmDycZBOGDRDI5wSlAwss3MPTS7TLZpkwDd2Pl8xhTDIcAx26TCucdNjFIUypYDWnqINnhG+3YN67OoAXMo6gKeAxTf15LLUdN/HoQ1moVZ5cSPRFg34SVwxJ1z+r80IMgjC2zgQkkBs2dgMBCsPfHPz4SdUlobdEJ06WStYAcq+GO+QlFvs1RhRDsdNCQQYXDkEYK55Zts24qVMmwdVfYHfRTmlwb/yXuPmqQWz/30Ge9oXU02kPM5ikDQl7dTovTj9wqXUJOMTH8OWYbrAehApZzJeiPYBC3gB8fvzo3OXbncK9i/KtlItw/fvA+AnTbeDuuCSSYu4rJkfAMKexNPsc5Fg3PBNnPo1QMfcia3y91AEFS46GsoIatoa0CoCoinIS9ZzfzkqScMa0zYdx6v+h+202t92Cz5W9eVXf9mWQLfe6bJKcA4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5259.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(6133799003)(38070700021)(18002099003)(22082099003)(56012099006)(10067099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SXVoSFNuemtwSmM3TzM4VFdJbUgyRHdsV1ozU2NKeUlwWlBLYUsrNVlyektr?=
 =?utf-8?B?VFhpbkU4ckdCOXdaMEhUd2puc2FwdWVqSUdoTEYrL25QU0Fibk94ckk5c2oy?=
 =?utf-8?B?dm1lV2lJc05HU1RFWTIwNnAxcFRNT2Nic21yYmVLWXJEOWlPT1FDbmdTTEk1?=
 =?utf-8?B?SXl1WkYyOVdIYWpYRTNjcW1ST3hUZXdzWU9PRUY0U2FuVktyT2VCMHFzQ1p6?=
 =?utf-8?B?bHFGZWRPdk9pQ0thVkxmS2FDU3YzWXlGSnlSZHJvMG1DQjRRcGJnem9DbWlD?=
 =?utf-8?B?eXZUbEJWTFZadGd5Q0E2b0Fxanlmem5rUzNhN2hzRCtzVnlTYkM1blpxUjJW?=
 =?utf-8?B?bXY0QVV0Z2FUZmZITzZtUHlSYUFiMExSd3RtM3RXcmpKZ0tEc25MNU4yRFhW?=
 =?utf-8?B?bWpVYlFFMkphZzROdHpsS3lYdHVubkN0NmRkeGppbHRjNmVmMW1HYkk2WHhD?=
 =?utf-8?B?aWVzOUJBWEhMUkErbGwwQitiYjJ0aEVDL3UybjVQZFFYTUxtWGVTbjRpTjlV?=
 =?utf-8?B?ZXNkOVl1L1QxN1lxeGJMQXFVT0UxSG5lcGVvcFJOL2xUd0RDeDkzb3o5SDRo?=
 =?utf-8?B?NWk2ZjBJUjhDNWhQYUxsWGxXN1JyaTRkajRlcllsMEU4ZCsvRFdQT0JUaGlB?=
 =?utf-8?B?aXpYOGdFWkppZS9QUmw4Unh5SjhiS0FYZUREZFlGVmtma2loR0hmQTBzcDRZ?=
 =?utf-8?B?Tmh4amhtejFlWDBCL1BEQ25HaGhkZU1aZTVUaUptaUNYSTVNUERxNksvbExu?=
 =?utf-8?B?N09rdGlWTlFUam5LVm00OVNkemo0QTNraEFtSlN3aXVjWEh1eFprUklUNUla?=
 =?utf-8?B?czBvS1hCY2FvSVFrK2JoSVFiRGJIMks3NENWUDUrNkJCd0ZBWFcwNkdDdm1Y?=
 =?utf-8?B?OFBYNlZTbE93QVF4R2xCUm9EOVFzSW5XTWZtQnhEclcyRjV5NEgxNS9jZDd0?=
 =?utf-8?B?eFNMZjJyeEd0UnpUR0lmK2VzZUc2YTlBb3M4Q2I3YkJWeUQ4RHBTNFBXR0lS?=
 =?utf-8?B?T0Y4Z0NRWVpNTGhiOEJUM0JLdkV2b0tMcWFLQ2hVWnpmZEpJaFNGTnVwMHBy?=
 =?utf-8?B?QlB5NnVqQnFJMlpXLzRtN1dvTW4rTEFMYmozRmc4amVWZkM1YTYxM0d3clhm?=
 =?utf-8?B?Rk80eXdEV1hsMTRLZ3ZRcEFKbFdVdU43YmpwM1BST0NDNlFJQytzdFFNankv?=
 =?utf-8?B?TGltWmhqajgwSlZiNHNlcTNrVUdaWVJtQk5OS0s0V1IrS1B6dXVKZUhTK0N3?=
 =?utf-8?B?Wkp5TnZOYUExaHZibXJUY2dURkpBa2x1eFdLSXRhbTFCWDRRRXJOOWxvZk1x?=
 =?utf-8?B?a1VWeEhsTUJhVWlaRzNpMjR5ZXFVZWdvWVJKRXE1a211VTBLS0NFRTBWT2w2?=
 =?utf-8?B?U3hwMGo5NTE1ZmpISHBOWkJHc1NkbW15R2dUZTBYNFQvaCtVK2dFQ3FBZ3Az?=
 =?utf-8?B?Z2w2akc0N0FwNDFma3VoMDNZcndvYVZucEpsZXBXb3o4d2NhNExlYTZ3NEQ0?=
 =?utf-8?B?dWtNNHBIN2RVbktYWU5keFNzUnRLMzFKeUI0Sy9HWGRheSs0dFh3dDI3SEJN?=
 =?utf-8?B?c2htc0Q5U1Ntdlp6bTR0bitWODI4eUEwaWJ4M0F6Q3FTa1JpREZJWXlSS1Zj?=
 =?utf-8?B?OE5STlE4anUzY2dEMnRCTVBCQlBTK0cwL2ZvWks3Q2tqRUlUeWdlbzV6ZXow?=
 =?utf-8?B?NXNSeEp6ellVK3JaR3ZmUmh6VE9rMDdHWENjMUo1WmoxdXp4dHBpNFUvRHFo?=
 =?utf-8?B?VnlZcy9HRnJ6MVRJY0FqaWR4UnZaMkNBNCtCVzdjUmQrd3dzNGpMZjBOZmhx?=
 =?utf-8?B?OWpheXU3YjZ6R3FoQ0NjU2VSUDZCUjE3dlZYR3F4RjRrVW9sSUlhb29GTWU0?=
 =?utf-8?B?ay9qOElpWGsxa1RtQjJzT3R3WVpocDBrNE1hUU9VTGEzL3lLbkM1OHJYTkNF?=
 =?utf-8?B?MXNGV2VqQzNCN0xZY2RmLzJqdCtFd0VqRVRoejZDUWpUNXhJekZ3V05lakR3?=
 =?utf-8?B?L1ZTZlRFV0JMQjE2Z0VGejJNckJGb0F5TmhNWTFSbFRvcTFlREM0aXdTYWdX?=
 =?utf-8?B?RHYrS2hvbzBhRmtRUGRiNVlTTWp5L2dpT1JrdmJYdWtHVmVHZ2puYkNCWVBE?=
 =?utf-8?B?VXlqM0V0NDVIampWY1BaM3FvdTFxSzBWVGFvd1kzZHBKMDJ6bllNbXdIOTRC?=
 =?utf-8?B?TU1La1J0eHJobUZ6blZhbmZoeU9XRTlnS0VzTjExSlV6U05BdWplTHYxSUNx?=
 =?utf-8?B?QWRSOEpzbkZqL1RMMG1FOUhhUjNzdFRDR3dsUk1TaWFCNUNPNXpObzhLM1lw?=
 =?utf-8?B?dThETXlpaVhib2FSNTVaM3ljRmJGaVp5UUxCdHA4Y0FEQWxsLzMxUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B38EDD10AE9BC643A92863FA74DB1986@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c2552e8-0106-4363-eea7-08defbc22e3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2026 18:14:15.0966
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z1TvA+609jiIsIQ6xCNHHXMQpHp4yUdi/Zt+9vbGz7hVshf1LK0M0I7ceFhzV4+UZ7KTMwQfOUXSY/x7HC7XMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7142

T24gU3VuLCAyMDI2LTA4LTE2IGF0IDE2OjAyICswMDAwLCBzYXNoaWtvLWJvdEBrZXJuZWwub3Jn
IHdyb3RlOg0KPiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJl
dmlldyBmb3VuZCAzIHBvdGVudGlhbCBpc3N1ZShzKSB0byBjb25zaWRlcjoNCj4gDQo+IFByZS1l
eGlzdGluZyBpc3N1ZXM6DQo+IC0gW0hpZ2hdIGRtYV9jaGFuX3B1dCgpIGFjY2Vzc2VzIGNoYW4t
PmRldmljZS0+b3duZXIgYWZ0ZXIgcG90ZW50aWFsbHkgZnJlZWluZyBjaGFuIGFuZCBjaGFuLT5k
ZXZpY2UgdmlhIGRtYV9kZXZpY2VfcHV0KCkuDQo+IC0gW0hpZ2hdIGRtYV9yZWxlYXNlX2NoYW5u
ZWwoKSBhY2Nlc3NlcyBgY2hhbmAgZmllbGRzIGFmdGVyIGNhbGxpbmcgYGRtYV9jaGFuX3B1dCgp
YCwgd2hpY2ggbWF5IGhhdmUgZnJlZWQgdGhlIGNoYW5uZWwuDQo+IC0gW0hpZ2hdIFJDVSByZWFk
LXNpZGUgY3JpdGljYWwgc2VjdGlvbiBpbiBgZG1hX2lzc3VlX3BlbmRpbmdfYWxsKClgIGNhbiBh
Y2Nlc3MgYSBzeW5jaHJvbm91c2x5IGZyZWVkIGBzdHJ1Y3QgZG1hX2RldmljZWAuDQo+IC0tDQo+
IA0KPiAtLS0gUGF0Y2ggWzFdOiBbUEFUQ0ggdjMgMS8zXSBkbWFlbmdpbmU6IEZpeCBkZXZpY2Ug
a3JlZiB1bmRlcmZsb3cgaW4gZG1hX2NoYW5fcHV0KCkgLS0tDQo+IGNvbW1pdCAwZjAxMGMxZjc0
NTIyMzg3NDgzNDFiODg0YmRhM2QzYmJhMmM3NGFjDQo+IEF1dGhvcjogU2hpdmFuayBHYXJnIDxz
aGl2YW5rZ0BhbWQuY29tPg0KPiANCj4gZG1hZW5naW5lOiBGaXggZGV2aWNlIGtyZWYgdW5kZXJm
bG93IGluIGRtYV9jaGFuX3B1dCgpDQo+IA0KPiBUaGlzIGNvbW1pdCBmaXhlcyBhIGRldmljZSBy
ZWZlcmVuY2UgdW5kZXJmbG93IGJ1ZyBieSBlbnN1cmluZyB0aGUgZGV2aWNlIA0KPiByZWZlcmVu
Y2UgaXMgb25seSBkcm9wcGVkIG9uIHRoZSBsYXN0IHB1dCBvZiBhIGNoYW5uZWwsIG1hdGNoaW5n
IHRoZSBiZWhhdmlvciANCj4gb2YgdGhlIGdldCBwYXRoLg0KPiANCj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9kbWEvZG1hZW5naW5lLmMgYi9kcml2ZXJzL2RtYS9kbWFlbmdpbmUuYw0KPiA+IGlu
ZGV4IDZmZmQ4YmQ4MjE1NGEuLjUxNmQ2ZDkzMzIwODMgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVy
cy9kbWEvZG1hZW5naW5lLmMNCj4gPiArKysgYi9kcml2ZXJzL2RtYS9kbWFlbmdpbmUuYw0KPiA+
IEBAIC01MTUsNyArNTE1LDkgQEAgc3RhdGljIHZvaWQgZG1hX2NoYW5fcHV0KHN0cnVjdCBkbWFf
Y2hhbiAqY2hhbikNCj4gPiAgCQljaGFuLT5yb3V0ZV9kYXRhID0gTlVMTDsNCj4gPiAgCX0NCj4g
PiAgDQo+ID4gLQlkbWFfZGV2aWNlX3B1dChjaGFuLT5kZXZpY2UpOw0KPiA+ICsJLyogVGhpcyBj
aGFubmVsIGlzIG5vdCBpbiB1c2UgYW55bW9yZSwgZHJvcCB0aGUgZGV2aWNlIHJlZiAqLw0KPiA+
ICsJaWYgKCFjaGFuLT5jbGllbnRfY291bnQpDQo+ID4gKwkJZG1hX2RldmljZV9wdXQoY2hhbi0+
ZGV2aWNlKTsNCj4gPiAgCW1vZHVsZV9wdXQoZG1hX2NoYW5fdG9fb3duZXIoY2hhbikpOw0KPiAN
Cj4gW1NldmVyaXR5OiBIaWdoXQ0KPiBUaGlzIGlzIGEgcHJlLWV4aXN0aW5nIGlzc3VlLCBidXQg
ZG9lcyBhY2Nlc3NpbmcgY2hhbiBhZnRlciBkbWFfZGV2aWNlX3B1dCgpDQo+IHJpc2sgYSB1c2Ut
YWZ0ZXItZnJlZT8NCj4gDQo+IElmIGRtYV9kZXZpY2VfcHV0KCkgZHJvcHMgdGhlIGxhc3QgcmVm
ZXJlbmNlIHRvIHRoZSBETUEgZGV2aWNlLCBpdCBjYW4NCj4gdHJpZ2dlciBzeW5jaHJvbm91cyBy
ZWxlYXNlIG9mIHRoZSBkZXZpY2UgbWVtb3J5LCB3aGljaCBtaWdodCBhbHNvIGZyZWUgdGhlDQo+
IGVtYmVkZGVkIGRtYV9jaGFuLg0KPiANCj4gQ291bGQgZG1hX2NoYW5fdG9fb3duZXIoY2hhbikg
dGhlbiBkZXJlZmVyZW5jZSBmcmVlZCBtZW1vcnkgYnkgZXZhbHVhdGluZw0KPiBjaGFuLT5kZXZp
Y2UtPm93bmVyPw0KPiANCg0KSSdtIGFscmVhZHkgZml4aW5nIHRoaXMgaW4gcGF0Y2ggMiBieSBj
YWNoaW5nIGNoYW4tPmRldmljZS0+b3duZXIuDQoNCj4gPiAgfQ0KPiANCj4gW1NldmVyaXR5OiBI
aWdoXQ0KPiBUaGlzIGlzbid0IGEgYnVnIGludHJvZHVjZWQgYnkgdGhpcyBwYXRjaCwgYnV0IGRv
ZXMgZG1hX3JlbGVhc2VfY2hhbm5lbCgpDQo+IGFsc28gYWNjZXNzIGZyZWVkIG1lbW9yeSB1bmRl
ciB0aGUgc2FtZSBjb25kaXRpb25zPw0KPiANCj4gZHJpdmVycy9kbWEvZG1hZW5naW5lLmM6ZG1h
X3JlbGVhc2VfY2hhbm5lbCgpIHsNCj4gCS4uLg0KPiAJZG1hX2NoYW5fcHV0KGNoYW4pOw0KPiAN
Cj4gCWlmIChjaGFuLT5zbGF2ZSkgew0KPiAJCXN5c2ZzX3JlbW92ZV9saW5rKCZjaGFuLT5kZXYt
PmRldmljZS5rb2JqLCBETUFfU0xBVkVfTkFNRSk7DQo+IAkuLi4NCj4gfQ0KPiANCj4gSWYgZG1h
X2NoYW5fcHV0KCkgZnJlZXMgdGhlIGNoYW5uZWwgd2hlbiB0aGUgbGFzdCBkZXZpY2UgcmVmZXJl
bmNlIGlzIGRyb3BwZWQsDQo+IGlzIGl0IHNhZmUgdG8gYWNjZXNzIGNoYW4tPnNsYXZlIGFuZCBj
aGFuLT5kZXYgYWZ0ZXJ3YXJkcyB0byB0ZWFyIGRvd24NCj4gdGhlIHN5c2ZzIGxpbmtzPw0KDQpJ
IGFkZHJlc3NlZCB0aGlzIGluIHBhdGNoIDIsIGJ1dCBTYXNoaWtvIHBvaW50ZWQgdGhlIGZpeCB3
b3VsZCBjYXVzZSBOVUxMDQpkZXJlZmVyZW5jZSBpbiBzdG0zMl9kbWEzX3BtX3N1c3BlbmQoKS4N
Cj4gDQo+IFtTZXZlcml0eTogSGlnaF0NCj4gVGhpcyBpcyBhbHNvIGEgcHJlLWV4aXN0aW5nIGlz
c3VlLCBidXQgZG9lcyB0aGUgUkNVIHJlYWQgc2lkZSBpbg0KPiBkbWFfaXNzdWVfcGVuZGluZ19h
bGwoKSByYWNlIHdpdGggc3luY2hyb25vdXMgZGV2aWNlIHJlbGVhc2U/DQo+IA0KPiBkbWFfaXNz
dWVfcGVuZGluZ19hbGwoKSByZWxpZXMgb24gYW4gUkNVIHJlYWQgbG9jayB0byB0cmF2ZXJzZSB0
aGUgZGV2aWNlIGxpc3Q6DQo+IA0KPiBkcml2ZXJzL2RtYS9kbWFlbmdpbmUuYzpkbWFfaXNzdWVf
cGVuZGluZ19hbGwoKSB7DQo+IAkuLi4NCj4gCXJjdV9yZWFkX2xvY2soKTsNCj4gCWxpc3RfZm9y
X2VhY2hfZW50cnlfcmN1KGRldmljZSwgJmRtYV9kZXZpY2VfbGlzdCwgZ2xvYmFsX25vZGUpIHsN
Cj4gCQlpZiAoZG1hX2hhc19jYXAoRE1BX1BSSVZBVEUsIGRldmljZS0+Y2FwX21hc2spKQ0KPiAJ
Li4uDQo+IH0NCj4gDQo+IEhvd2V2ZXIsIGRtYV9kZXZpY2VfcmVsZWFzZSgpIHVubGlua3MgdGhl
IGRldmljZSBhbmQgc3luY2hyb25vdXNseSBmcmVlcw0KPiBpdCB3aXRob3V0IG9ic2VydmluZyBh
biBSQ1UgZ3JhY2UgcGVyaW9kOg0KPiANCj4gZHJpdmVycy9kbWEvZG1hZW5naW5lLmM6ZG1hX2Rl
dmljZV9yZWxlYXNlKCkgew0KPiAJLi4uDQo+IAlsaXN0X2RlbF9yY3UoJmRldmljZS0+Z2xvYmFs
X25vZGUpOw0KPiAJZG1hX2NoYW5uZWxfcmViYWxhbmNlKCk7DQo+IA0KPiAJaWYgKGRldmljZS0+
ZGV2aWNlX3JlbGVhc2UpDQo+IAkJZGV2aWNlLT5kZXZpY2VfcmVsZWFzZShkZXZpY2UpOw0KPiAJ
Li4uDQo+IH0NCj4gDQo+IENvdWxkIHRoZSBSQ1UgcmVhZGVyIGRlcmVmZXJlbmNlIGEgc3RydWN0
IGRtYV9kZXZpY2UgdGhhdCB3YXMganVzdA0KPiBmcmVlZCBieSBkbWFfZGV2aWNlX3JlbGVhc2Uo
KT8NCj4gDQpGaXhlZCBpbiBQYXRjaCAzIGJ5IGFkZGluZyBzeW5jaHJvbml6ZV9yY3UoKS4NCg0K
VGhhbmtzLA0KU2hpdmFuaw0K
