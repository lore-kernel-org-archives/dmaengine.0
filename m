Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.115
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793700880;
	b=Ob56JqqgBkmpGyowGEpZ4mkvWkhu3XgoohPdct3vu5Ob95nKmeoNsaHiyFEBaFm1ykrw
	 eLdb1rWcxZv9ybGGTUj9T7cjjMROvTi44n+hItHIg6n7QHYcHI0eh3ufGb3oGwWN1yjBM
	 c6+Gfv6psjGocmSi2mfEHF7zhIebrUY++osi8sxJPj83OiQXxIfE6ShrsqPylxmy7mGIW
	 79+xWTQLNeBUPaOXklaV9IvCrvPWf/x5F7djYr6XrMmMSGY2sttSPgaLw0gWAYYmTYCrQ
	 VHGzjJQR9enfLD7z3N4AR4NsgmWFrqQOx4K+xwH50BfdiZedmfvOUIlRIW7Ws8EH5CQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793700880;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=NCLwlUv0C0r5tg6/L7+D4QZcztWRREgVnU6Hs4TUM/E=;
	b=QxpyHT6qg/4K/tM93GJ0jbKDwujIjfkfu47NUSXFio5mV620Nm5QuVS5xRJDL93hoAP6
	 k9bqA1JEsuJDsL9Ado/qA/rNcg+AdU22T0GkHBa89SnVxYRPi98M1KEqSaG0U9yMouMJ9
	 jICQ+qeHHVdE3mxjx1rzW+KrVwvDry0BTXwFZgUKti1mK3tnmyBUwRtKne8ozeLY60BZF
	 /oKTVwo26CNjnDM/mVMGHZq9P4OiGdd7k8ENfC/a/Ih3otBAP4bby/qu5nGpm9gSrTDl6
	 zDQ3etI+VZQ9va+tFmggA9/mh7XqdS1agrOZtb6Vc0YD8QLuVYIEyXLq7i8+2rKw1Kw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=crepuse.com;
	spf=pass smtp.mailfrom=crepuse.com;
	dkim=pass header.d=crepuse.com header.i=@crepuse.com header.a=rsa-sha256 header.s=selector1 header.b=UBLyr4Uo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.115
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022115.outbound.protection.outlook.com [40.107.75.115])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58176606A334;
	Tue,  3 Nov 2026 10:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58176606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crepuse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crepuse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=crepuse.com header.i=@crepuse.com header.a=rsa-sha256 header.s=selector1 header.b=UBLyr4Uo
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fh6R4RRFRQXs4JmmX/RBgzP1JOJmjL2PsYY+DmqoI/AtDocN7Nfg0CxBc37tQNyv1j7NPFde6opfbvfEjRlZ/CUnPaeACxNzx/2NiuRtDo9PWIdUywJq1GynM3eVusBlWNsJMNVuz8I1gFHvEV5YpMTf48SFuP/FAtAhv2alBYFVaOwUfN1UdAbmJqoye0QQ8FuP88yfX8H4GlPn6smM9xAzAalXmoU8hXzAwFfWCTAy5Gt8Dz6JJF7Ddp1Ps5lVp8Zd5J0O3KR9Ljb+koZxsFI1N4sYFqaF9gMvFfOkrAk1iU+9awmi/+WAIy44XlLtUSH1tMm0my2+xE9aI5QhuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NCLwlUv0C0r5tg6/L7+D4QZcztWRREgVnU6Hs4TUM/E=;
 b=Mwc6zXQjHbkh0+Uy5PwEKc0UUpXe8u9JOcDwodEX6bdDoG5aGH4WvYEaQ2a5GMALSAXZ1NQHABGj6Q9j/k0j3WrQ4fWx/7nYl5WYd4wexu9RTevcBgLJg3kVToyNAB8Nj5EM2lecYrFLcUif9AOPa81HWz0eHHz0KmdLTBTN6n7z0VK++9c1mnZw19kMIM6uUA+5MQfRflf/F9HXDN3WROGnL170YA9M8uai3ZzusKAsv7sbjIZQ1CKicfjK4E2a50rZ/FKBXYz7cbJlz6i1oI2u793NntIyoAVb6W3gpZxtm2xhp3KCcgqu077KVhnUpl3PvcLD6EC/z4lubwHyuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=crepuse.com; dmarc=pass action=none header.from=crepuse.com;
 dkim=pass header.d=crepuse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crepuse.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NCLwlUv0C0r5tg6/L7+D4QZcztWRREgVnU6Hs4TUM/E=;
 b=UBLyr4Uo1O78Quq5spRPxRb7jJdwbRl9kIArHr24fUr+6d/nv23wTpHsk0F8LFy2xAGx+PpJVrOytg0KXCNHJyRnWRfWSY4xLvYHfFHolR88NMkC37M/UvDQhTMDDtT0+3lRIjo0Hfwadl+aMWxOMIB+ZccPLnKoQuBjQNQ//gXfqSJxH7YKFFE9gnF/ZtU089kwb/MfVMXzsxVHKLKm66GRZXBF2/lbAbiWyVOPWYxOp2uspBU2rzpT7cQz+WmoHgZ8Gntn7F/6CeQKeCayimYPvL23IEgXFBnVgi9ROhdWfSQau1dUwr8k91LXN3HqjVa0xDqXKY31j5hyjXiftA==
Received: from SE3PR01MB8203.apcprd01.prod.exchangelabs.com
 (2603:1096:101:32f::14) by OSQPR01MB6090.apcprd01.prod.exchangelabs.com
 (2603:1096:604:277::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 10:14:35 +0000
Received: from SE3PR01MB8203.apcprd01.prod.exchangelabs.com
 ([fe80::c31d:e8c2:ba43:e11c]) by SE3PR01MB8203.apcprd01.prod.exchangelabs.com
 ([fe80::c31d:e8c2:ba43:e11c%5]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 10:14:35 +0000
From: Mizuno Miotsuki <founder@crepuse.com>
To: Frank Li <Frank.li@oss.nxp.com>
CC: "vkoul@kernel.org" <vkoul@kernel.org>, "dmaengine@vger.kernel.org"
	<dmaengine@vger.kernel.org>, "krzk@kernel.org" <krzk@kernel.org>,
	"ulfh@kernel.org" <ulfh@kernel.org>, "Frank.Li@kernel.org"
	<Frank.Li@kernel.org>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
	"huibin.hong@rock-chips.com" <huibin.hong@rock-chips.com>,
	"rmk+kernel@arm.linux.org.uk" <rmk+kernel@arm.linux.org.uk>,
	"sugar.zhang@rock-chips.com" <sugar.zhang@rock-chips.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] dmaengine: pl330: Fix unbalanced runtime PM
Thread-Topic: [PATCH v3] dmaengine: pl330: Fix unbalanced runtime PM
Thread-Index: AQHdXMV208bX6Br160Gw/tHwbdDZA7b//nWAgBGZNgCACqb5gA==
Date: Tue, 3 Nov 2026 10:14:35 +0000
Message-ID: <ECCA077A-F53E-4F1F-86EE-2871A9CD564B@crepuse.com>
References: <1650450456-34351-1-git-send-email-sugar.zhang@rock-chips.com>
 <20261015-review-pl330-pm-original-v3-v3-1-5be09f37df77@crepuse.com>
 <atEEi7Uc7DI2pkg5@lizhi-Precision-Tower-5810>
 <C35ADE64-5E80-454C-A66A-BA2B22EFF386@crepuse.com>
 <auDEcFRBeICtT6LP@lizhi-Precision-Tower-5810>
In-Reply-To: <auDEcFRBeICtT6LP@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=crepuse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SE3PR01MB8203:EE_|OSQPR01MB6090:EE_
x-ms-office365-filtering-correlation-id: 812a4170-9cfb-4a2c-150d-08df399342de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|6133799003|10067099003|261102123227099003|22082099003|18002099003|38070700021|56012099006|4143699003|261022075727099003|261026121527099003|261026140227099003|261021121427099003|261022105027099003|261028144727099003|261021123027099003;
x-microsoft-antispam-message-info:
 0sAV9Lv5XEz0DfvWx0SMVXcGHCKxkujEpy79UqiJGJ/zl3zERZZo9bi7gZF5hEo+71DF2HXXM+EkyUD1ZkFlZ5XrKZyqxIm8WpBS+Oy/skDeu5eS4kU6NvAgRa7igs9EpZgMgasQov7qhwruWXk4m8r9JdZbmdyPQcWfZ2JP7wMW1p9VuIWwvnwl/7ZDEecM9tTwH9UgKcpzeN3VrhQxX0TcA0s47xmyPJ9MO0techz/YaLtEjvqHGIfWNVPIVhJzayV47Eu957UzAFCWZightzjxRXsdVJR0j77epIP3ZPLl6diQLXr2qgUZ5VhClLvYJsekEUzP7RxcwTliH4w7hVUp5Kdr+bvYEQH7UqAZbJLk68PRWj2IhuvaoBPI/RR/Hs3475n+3jOsYZkNWNkCAP07Dg/q/9IMIhlDtOGQl+3BoS36+p2SNF1R88SqdSIOy8bFCs5D+63f4eLGCurOg9WYufoPvO9uL0WQpsKbkJamX9j1golvGpK+mLO1RpcSQJpHynp/LyCFU0AaohXUYksweI584q0Vg7x0sFFCSIdQzEWSuI3j/g4E4bxH/jyhYNVc8A4NFHvpHdMKKhRqkkkcWheIG79fvXFvOYdnJnkORtBFwvZfhAYI/s4oxIRVQjx3PWXYklN4Fktq5TO038inZqTuINbZkYmA3VQj+/3zt0P45q+rNgD84uBaS5O0I+Pv2PU99WLxWN7X71K9DJnNPBXtGTSEnHdOm82gYQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE3PR01MB8203.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(6133799003)(10067099003)(261102123227099003)(22082099003)(18002099003)(38070700021)(56012099006)(4143699003)(261022075727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022105027099003)(261028144727099003)(261021123027099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Ixi4DqYJmvBV7LK1Riruc3zyEBmHG+oSj101jMoK1R4vOGc2GX8oQIXIT0du?=
 =?us-ascii?Q?Q3fJ2edYNwdlUelxEpZDKS+Fppt3bN6O93mNeAl+6AGIcOnMjQBsL4SRNRco?=
 =?us-ascii?Q?5hbiC6doD+bHX03pVRkGubUWJ9fDro8GyKRnTEJuTwsVrJW+9ZDdWFb3ri8+?=
 =?us-ascii?Q?3XZ/QglV1x7Rv5L4aBCBUMXVC8FKNdkKWXbHgNHck5wtCT1mYQiGobH1LT/b?=
 =?us-ascii?Q?Fl0pqfPSmi9ngElNAZ/yHyf3lv+fNiEPSc6UQqGk5sVJTeIchKObV6j37GOX?=
 =?us-ascii?Q?Zim765weDJ+fPqRNqM+z/vY1kkFMPRrwf2KDvCLUCJiG550FDELH7djToytB?=
 =?us-ascii?Q?TjYYa8RGkipoMGk/2VWQfidcCdsrJg63g7taXCtI5nEVmoYM7t6AGThkbwI1?=
 =?us-ascii?Q?pkMcQ6RhlXMxGWQTQnIpk+LrSKgyxh+SLcA4Yv9cz87xSYB3RefzZSOL+w2Q?=
 =?us-ascii?Q?GvW270qVcFz4/oqXOG8cPwgbps1lSiaI5iLxxqVmyI7k+JP6pkauUoVZSSYN?=
 =?us-ascii?Q?jWUJmzNGEYvUduHwZ6UUcUFDGQLLpA0PkQpDVrU9NkdSvcA+VfGyHBqL8WEN?=
 =?us-ascii?Q?lltQ3kcoCFiiEOS19L6/xWZnegfyVMW2S0EeKKEjM6/4VoBBLGSNrZK3RlrL?=
 =?us-ascii?Q?zgEE7rsHm40Ykdvl5RnttQujIcFAOjo3cURSQRxzT09cOSGK7bS/ZlihWE4/?=
 =?us-ascii?Q?sKrfsdnNb0UttzaOYXxYJ+GiHVxzWnSwOyCmSPJtDlP5r39BwUqmzCYxsxFX?=
 =?us-ascii?Q?7GYw4ARNtj3x5bC9b8Kswnao6bsmCXPF8cf9alw2Nt6Wo67DecLLMUFQpOEW?=
 =?us-ascii?Q?DtAjA/ApCChwNMlv7/1eP9KCzghJqfsRi2p672N7ASEjafKv1KpX+ZgRR/uK?=
 =?us-ascii?Q?GwDbidfGfGfs+miwkWIYaqTIQTfhmvlWL6TPctQxg0ItqGOj0wWu/2wZm2Mr?=
 =?us-ascii?Q?3D+4VeoXLu0Mwj7xi9Vx1mofuLo20ETjVNpL4ZDqZp3tdZfah5/rsyVOlhfb?=
 =?us-ascii?Q?Wofcq0j0Puguu0aGIXyCGKD+YnFLkaGqFuT55UYxg2T2Ao6o6+N07wPyvH1a?=
 =?us-ascii?Q?Fz8CI2SRrgmBPlKmsNmlXwBv5BAf3thcSgrgYSWDEqnh/qXXL3UXzuAQ5jsS?=
 =?us-ascii?Q?j9ij46BLE+I7ikH1hxkITwMCxotzgBYjIcrz+Bhkr4m36lD1c6AZmTZwnEz7?=
 =?us-ascii?Q?zqCkrZtExB1A4I1sGZtZfAasavT1LCXjo9T/ynSc0kS8ePfk2M5v4aFUH22l?=
 =?us-ascii?Q?oGnkg6Roj6ZbfYAV4vuHiRm6c/pdoNCdDqFPYC/zX4lnqMVAINnoXtLhuCn9?=
 =?us-ascii?Q?eaMCrOeWfVOBanLFOIaorDL3xr0M5DE2+c2SwR9MSZLURWtZ21PgNyDZCEaf?=
 =?us-ascii?Q?4DbuGvnEfZRsO+dI+M81BSMD8QImre1wWsXQg3J1cTfE+sVGGzYaf+VA04ia?=
 =?us-ascii?Q?9EH2vXpeMlEQmja5O5/+OV6444BV6BjFKNcYc1+eYUd+d1mnmaRIpecW2kSs?=
 =?us-ascii?Q?g6dVqL3KdQP61G9roJSMJPF3k1Zh0r7MrrPUe0qeYSqHnYneU4Z0DLnBRjCc?=
 =?us-ascii?Q?TQ9nPN8f0FiQn16yTdWrtWq7Y70VmfrBX/kZToTY59EIq4hQYp2zylDyJzod?=
 =?us-ascii?Q?Zh9tRbc6ww280pr1+2fzamAN36KYo0PdFQqbrwHD5N8x2rEfj/ITVcpj27x8?=
 =?us-ascii?Q?NnCT/+oRg2C15goJwTR+d9P6iRzSLJlhzjB3rgxIUH/b3fHZbixaHv8FtuNl?=
 =?us-ascii?Q?Mw/8kAWdEg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <586890AD980B364FA2E8AA336AD125EA@apcprd01.prod.exchangelabs.com>
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: crepuse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SE3PR01MB8203.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 812a4170-9cfb-4a2c-150d-08df399342de
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 10:14:35.3721
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9e189589-0b8b-4283-80ca-b0157c0a04fa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V532q1xqc1/M2s/3lU2mXF5BqQxldLp4GTM3uu+dAQMCnf394SHbXPjnMvju6+oAK/UMIdDRdc2SaXy6hLl7Rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR01MB6090

Hi Frank,

Thanks for the suggestion. I reviewed the descriptor lifecycle and implemen=
ted a separate per-descriptor PM accounting experiment to evaluate it.

In the current design, `pch->active` represents ownership of one channel PM=
 reference. Both `pl330_tasklet()` and `pl330_terminate_all()` claim that r=
eference under `pch->lock`, with the actual put performed afterwards.

The reported imbalance occurs when termination has already consumed the ref=
erence, but the late tasklet unconditionally sets `power_down =3D true` and=
 issues another put. The v3 change fixes this specific case without changin=
g the existing ownership model.

For per-descriptor accounting, references must be acquired when descriptors=
 first enter `work_list`, retained across cyclic callbacks, and released on=
 completion or termination. Repeated `issue_pending()` calls must not acqui=
re duplicate references. The experiment also exposed a separate concern aro=
und `_stop()` in a late empty tasklet.

I implemented and tested these cases. Deterministic tests using extracted p=
roduction C functions reproduce the original imbalance and pass with both a=
pproaches under the tested interleavings. These are host-side tests with AS=
an/UBSan, not full kernel or hardware validation.

The per-descriptor approach adds PM operations and lifecycle complexity, wh=
ile still requiring channel scheduling state. I haven't found a correctness=
 advantage that justifies replacing the narrow fix.

Krzysztof also independently reported that the equivalent fix has been work=
ing on RK3128 hardware for about a month.

Would it be reasonable to merge the existing v3 fix first and address the `=
_stop()` guard and other PM lifecycle issues separately?

Thanks,
Mizuno=
