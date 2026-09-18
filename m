Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013014.outbound.protection.outlook.com [52.101.72.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FBF3AFAFF
	for <dmaengine@vger.kernel.org>; Fri, 18 Sep 2026 14:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789742085; cv=fail; b=AeKriA0rrrSuvy2B5C7FUWvQHPEOqfzqo4ZtdnwT7fJOwwle3OJwmfDotho71cP2q3JZK+JEChe5TVNGH0Xk0h8fvbzdXwsUwWYmrYd1CdpdSgTox4T6tAuOrDevXmHbiOhDMIt+OISKNmQqzZvORAxOAZEcZM3N7hejL7S6e7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789742085; c=relaxed/simple;
	bh=DAVGcs6xUuwBWjejegsgDycfBlSwA15yVnJhUwMqvJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WnRQnXpmGmTrHbtyVmBAu4BlpddpyvObWD9Cgdigs1+zevJ0zKNbYMMeAqy9a+r/dRtTySVXrjQN5GBvBNIeMkwhMbN0t3hk2OqgnC6qRs4T+3ekYr714GESkAo/kSdkN0KTVjot5bFPXA9psFen0pIPxLiLFM8sbGsD71cvSr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=U0QWNPU+; arc=fail smtp.client-ip=52.101.72.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="U0QWNPU+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tyo4hjwyAWW345JjwZmS3ojgO8FrJRRDiBATeOtR8rOHnuTk0xmleyfn/PtYjJxycUOdXWpfvsx++HXqoHtH9QnoZaeI74uqMA/tOsoSCgiZoe3IDgaBzQi859+R+CZD47eFlsuR1tP1109HVd6gJhdxCuPdMnNjneGyjsNOnfLUx2pbERguz039TLOnxDW6bY9ixus9rGKrgYb44lU6OiMJO4G+zzkNUmjrXR2XQvv6xMp17Ig1j6Ngohcfl3PVMLRHe/7ujEZ30T8VwUJiqQSG0/WfKAB5vetm137GRG8QvcItFZDo7YxZ7/AGuNPFe9pCX5bTH9tiekbe55/1wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DAVGcs6xUuwBWjejegsgDycfBlSwA15yVnJhUwMqvJA=;
 b=wFplLCW7ACpqUsM52mJwpbaE1Y9iRBoTWuNLRyfjERpFe7waRaML6UgiJaZCupoFhJAUVByRcOOM6CA70tSsc8EfKK0QbrHGMmO+p5jAiADhx5bYaZlMf49F/6zT2Xb6NiwvJksPhhhYnbkorph+Q31t/3GbGxnkJkEIQ2VGlX8M1a3eRl+Aox6Ve+RWM/ASjGrNJvaRmd/+/qNHo4QYE5l29G2EtTpSnX4T5YosC80VpiZH3IKKHSnLjyjW9+3De+ClL5B/99vyGVAf0BSSRWkmYPyLk495T0evwq8aZIENL6gsIo9OWiSMNo8CXWPJs55iOgGgwqsZiH0mRa6mXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DAVGcs6xUuwBWjejegsgDycfBlSwA15yVnJhUwMqvJA=;
 b=U0QWNPU+/f/yfQ42ond2DNeqm0gKsAeuMohvkja+4xvkYCQm+d+D9H13POnbeoY1ScEak+4ky1U9WYZeTF+KnNpDFmFyq0AFegc3WDFICQF9hw8k9KJ8vpBnvWF9fNW2dghjVlH5KAXVYsnlJEJ6dm96VJfJsqA2tyVBz7nk4PZgUIN0TjNku4lGoBudYtAHvtqLBfBJsOh8aoyeDHKYUBdzG/zlQ+E2r+T2VVHwwb3EkqKaKgl8n60qJ8O6BRHaYyvHIFihqY2Jp9JJ4lnshR3+/MLyzZX2RNevga03p5tSovPerX4VWLr6LITfPLQYulZkuyBPuXSPCWrHHRKswg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM8PR04MB7220.eurprd04.prod.outlook.com (2603:10a6:20b:1d7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 14:34:41 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 14:34:40 +0000
Date: Fri, 18 Sep 2026 09:34:33 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org
Subject: Re: [PATCH] dmaengine: Use unique debugfs names
Message-ID: <aq1L-UJ4ehCj3aNS@SMW015318>
References: <20260918-dmaengine-fixes-v1-1-7e10da1633c1@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-dmaengine-fixes-v1-1-7e10da1633c1@kernel.org>
X-ClientProxiedBy: PH7P220CA0129.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM8PR04MB7220:EE_
X-MS-Office365-Filtering-Correlation-Id: 7299f914-567d-4357-dce0-08df1591f93e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|19092799006|1800799024|23010399003|10067099003|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	eDONPyIaq5FEt/jlHkBM2L57mbgWA3tx2PMqzGm7dS62r/kpeyKDVYzruncS0vNVcTf2Ge6ohEbIIhhfH9cJ9oPGfFZeQn/a6hUk4e8r42eH+vwx/L6t+I/KFTGwJDVcv9a20OdiBfwhrknmckr5VszbF+pcf2OkXGbpLEqlv5pr8mPeFsnOQKfVveMbFFXcoz9ZxuKMpUFsi6e/TS2I6CCr8/aPDMLAkOXuOHmN5pIqelHLUHJMXYABHA/N1HtT+4ULl1z8HJsEW9LfpdkvtN1jgydlZv9o7/3JqmBeWmG9CknTeuOhd+hRWOt5voa1Djy5KnKsAVb9aqPTh8lsrSo2jpupLXHFpHkaN5/lHQ68pCtWhOYP+Q0aQy0tysUYSeETHvUwFOYx7mzMBUUpSYxS2zH4gZCbtyR/rpTK0Uziv0uDKbRUbxBSHVw+q4Fz7NCRzw9+w9DAgQj3A4PXBdljE31+egWqyjxIjIFMf4EHTYbkHanM768ksjQpNZbURIlYjEVFD4UDRAimjLOeKnBWrOUVRhHLq5KyW0lT4THZZaBwluoZoitSkmGyt4VAql/HUgqMGuxhM83jKbldtqvMbNfuhNDcLxfRYuCFRAOBSLkpUJyqZl35SK5pUKvolnyHLfWzKU6kQP8k/OKTrYEbvjOzdn4WnkNZOcGyOOI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(19092799006)(1800799024)(23010399003)(10067099003)(11063799006)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QLThWvsgclO4sTdVzFUkm0ODuAPkfhAUa9G6pbB3Vn6dtvoMfnZhn2Z+yWe8?=
 =?us-ascii?Q?66xO8RgLeS+a/cRSvbtRyhgueYBhTd2vsCvqHxxCmk0rkp7941RmCN0a3GJD?=
 =?us-ascii?Q?M9t11wDe3MFRguhIjxpHnQdE4XCNjtg3wGoero21ZZqH9pHXiDWzr4gi8yk6?=
 =?us-ascii?Q?fO/FSGmH5H78hv3C8esGXvQRlcRom3g+rzo9S9qpyj7WeQOyqN2IsTj73M0y?=
 =?us-ascii?Q?BPI3I9T22zS1Ec0UJpzeA1W5+UFNzbpFHUXNnBxZBf7YQSLB7pqLnZqzvswV?=
 =?us-ascii?Q?QzVtoh+GipL8cWkxMzD1z0VgtikzZ2jYluayaN6RGNaUDJDMIE/C49VlTgcO?=
 =?us-ascii?Q?KsiskLzHV32/WBG68ahXfcpBtb/0BggXl790i3eRnAsCwP8f0hbuUAr2ctV8?=
 =?us-ascii?Q?KQv3KXVQpuWradrMV2GwGt8preIqt53s1CfnRQfxqM7k9ryJMbBecmpgN8Lr?=
 =?us-ascii?Q?L4pAR4ntiDfTwbBBySZnOigF6DSgrYn/iJ8aS/lThWpOUwAlvC7Ce7eXEsmu?=
 =?us-ascii?Q?99tFd/DNNddcL30nm6G1KHQ6Jq4cBO0i1wEoLl5gJq7ScqXy9fkeAkOKOyR/?=
 =?us-ascii?Q?2R092Wnj/iAneHsodu23IJl8TgpbvrIOeKi62uAM/FVV1WP48kZLr+tD5Ohr?=
 =?us-ascii?Q?+MgoYszQV562cYYG3ETxg30MYG/FjxuE1lj6/1sW+ABzh5+oWP5ecWFeZmZp?=
 =?us-ascii?Q?blWxh6r8oH1u+rbRDzeP2eReMrLIgQBUyTSq0pEhoNlPdzlvJ8FgmkPb+IdZ?=
 =?us-ascii?Q?bu+MkkgCl+GIyI0LBKJun40dnG1KuIp3VwLXz8QE1cLtdtDxjGRW9E9c2hw5?=
 =?us-ascii?Q?2I1RhqRkUSpzhoHWMXWT9fghD/IsqiImf11+lmwhB56cdPH1J4YZ0tt1Tkju?=
 =?us-ascii?Q?G22mIP/AbtsnrPX0lq+9x9j9R63f3rbDXuzOIc0OX/ltj006Z3yqPv9cHo7H?=
 =?us-ascii?Q?Rf4mefqfwURf38Od0sFBELsL36wHsBIabj6bnUsUUaU4ET1BBnYXAaQ/HUpg?=
 =?us-ascii?Q?6KTZ5xnya36Yh9EUalOSmXvtHgoCKKoFCTPiLy9CRpu6Oi6aBdj0/KZl2yMJ?=
 =?us-ascii?Q?1j6AUUaKMMYuSc/1RfuUHyJNPl1MGrZ8ZZ7789FLOKxrlQIhzPci9qwhAdjj?=
 =?us-ascii?Q?9DwnfJmMwtxh6Y+yaF1YsyOq16jms4FfYD/cR3LpVVz123DpRKTfBLGsZnEv?=
 =?us-ascii?Q?xkFEtpcWjo6S0244Os+fQec4Sl8U5pkL6s4qYmbeajOe4eSKfJMIE5qj1pW3?=
 =?us-ascii?Q?i79nAGacIXECAIP3zWmpOtt5u8NMJUXQLimU/nn0JHqZqYnql7ssAnd+WDM7?=
 =?us-ascii?Q?W1AZvrLprvJGzDh/fkvu9nQhE/thhvw8alf7JodivXXYNbLT1bkEI4t15OLv?=
 =?us-ascii?Q?sf7phuW4K3Sh3rE7Xlu7q/8TjAeZwx5+lZ+cIzBuCZTzuupZMXvJ/jXLvXyO?=
 =?us-ascii?Q?lyfdf2/XVj1fdiWrBOVI4aProwrUGyYwrP1Ij4aCrAfHBgXjB1P4MXmuc5QF?=
 =?us-ascii?Q?KO4QfVERnQuQ2tBWSvAhP7E5Hkk9n1KR0RDUGq3ozyxdIXYwW4RFc1vEdgUh?=
 =?us-ascii?Q?sHAlt2tAqsqog3cRkRMMhy7qlm10/w3fnmpJCd8favDV8lIH9nVXA/2Qg2B8?=
 =?us-ascii?Q?Fy5efex3FVppxiu/bhy5xXkI0TPJHXmTVLPvD87VRGyWMqcUyKvG8hC5oINm?=
 =?us-ascii?Q?6KSaK5qoom2GRbuko/WM+lSy0uQtm2T2ZfIGu29Shh/XoYFsjoknnRWDQova?=
 =?us-ascii?Q?M/h4Gb99uWRcY76QyiPfZlP3X7glXqK4vvGbAOASQm7/cJqTX8wG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7299f914-567d-4357-dce0-08df1591f93e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 14:34:40.8043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IyBwNtiqzwkobsPFvIj1xFhe/K/i2RJirTaG40uvB8ShI7rjNlZh08dDJraSDD61hPzUHJVB2DMY8HJO73P6salwcNJl9flPT9YurGM2+rArK6DyFYTY/LvD3NYJ1cut
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7220

On Fri, Sep 18, 2026 at 11:15:14AM +0200, Linus Walleij wrote:
> DMA40 registers multiple dma_device instances for the same platform
> device.

d40_dmaengine_init() ? I see just register one dmaengine device. I think
it may have other problems.

Frank
