Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11020085.outbound.protection.outlook.com [52.101.228.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC36E373BE7;
	Fri, 28 Aug 2026 16:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787934989; cv=fail; b=VN4vfop4np0bfynq25nYhF03G5oWyuZntI6ncpAFiJ7udFli88qKVmr9mLCoOdzZtbzyEVokE8O5qmnNLZd6Hp50car9UlRCTp4xYDRmn+nvyJbYmle+4NQlQen3PBrm+t3yu8HAwQa06zLPgUAiJFXivePJYBS46hrmmmz/cAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787934989; c=relaxed/simple;
	bh=JiZLO4f7NzX9pZJSw6EOyFQXHxmPgQEA0tbl+te5wos=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=i38LwGKAfnAtMTkcWv6V69ZQKRuOsQ8oLLap/rjlWHbsNtc4IaeGXz9DagUmLoxkLC9leNQilrfrAQG+aHZn6/DUzsWBlsCupMf+FXldSjKpN3Py9XyvwJ25eNyMv8pHUW8cRkW201eY6e0+rFnKvFicSlfIRHU48dDU5Vc/0wI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=AFNHxK/U; arc=fail smtp.client-ip=52.101.228.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="AFNHxK/U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xEIHezQy6WWDWHS4mX9+D7e3FPPn6jI8xOl69/OJStx/vMXWGR4VVh2Ne0TxGoqADqbHx7ym9w/iukcK8/PTQVRmN1t+UicoRRaJNJmXy/j2PQ3omVFLJbzHAot7jYYM5PxNYmIfMrI7401QGWJvRsNxsSgIfvHNjutz+fKUcvfwaD8p7MCd02qQzGiHS5ZdkT3V6LKWM3qTSbxrqXJcpFZJN0Rj6Vy3FmQxjnZsZXIx+2wzmow01gjSf2KDcbEdoEDa3zKuBybYJJV5MplV9DdEKcPwP9DX+Lbl7nQ+/9jHurm/JjUy1GMUkLJyaVzqoauaNo7SMQsU0rhAZ0NrpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pXoy4uKejnKzfvgUX6Xg0uCCuiSI23Ldr/rKW4PsznE=;
 b=d3gEUzOjWZiUMhFfHaXvKjMz7ykPEOcQ63YrWiPL1LA9rdmARhzgKfPrIq1NgszBY3SgYOoVRYUlDPS8/eoCqQqMJxxfcK3/eNo/mbk4gA6qVXuhbRhx9uz5QfBiIo2ZMmT1+uBWmUy8XCuSE/1x45y5gHD02Ngj1RA/5INmo5ttIEoy26fvCZvXW68MwbvR7wHA4I4ziLoEdkljMCGmuCFzVNdm07tqABj2ENH1qdxlz4si/IYaEYIudnBtfd4J3FypRWTs+A0GuOxADWNbteOtIpbzvkR1/uCpRfTCzvXiQnFeYvWzqdB7wCaIJwryTCIQVVL9ovlX1VGbFzOjlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pXoy4uKejnKzfvgUX6Xg0uCCuiSI23Ldr/rKW4PsznE=;
 b=AFNHxK/U/3gnbe3BwrfBvFzpnD+sdT5+YucSinPrco9REVN5YzBspMPzUcOvPwOj2xSxAqtYviZQOuD99QQqxb9//wTpgmk6z/DlVkZQrWvTuk08HlA5hmNp+6Esrjj7AwD6xYi4DdZcjCX6pEOpNefC7je/cLIR1RfWbkIci5o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS9P286MB7093.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:414::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 16:36:18 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 16:36:18 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] dmaengine: dw-edma: Prepare channels for remote use
Date: Sat, 29 Aug 2026 01:36:08 +0900
Message-ID: <20260828163611.2691264-1-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0034.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::19) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS9P286MB7093:EE_
X-MS-Office365-Filtering-Correlation-Id: dcd27d75-5d48-4187-164c-08df05227c82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|10070799003|366016|376014|18002099003|56012099006|13003099007|10067099003;
X-Microsoft-Antispam-Message-Info:
	Wd4hKQmT54e9O0HE7ilW89RjMrE0DLsnopJXfgiRjPCXr4AihumLQUaaHZN8J1Z2JmkypAqbthFxYk3i6bzLOhi1Z7PusA6YmAKUBF1kh5ciaKPYTNTs9kxkuLbNO2pecGXCEOtbBdUjpfA8d1Gwa+Y3sZPCw/zOyyEpxa/5x5NYMsB8mg9H4sSaPxNMSb1WG0yF96XdloguXrGfFgb2LKTAtDcPuOyYJiC2v1D3+G/BMkwVR9Y/KpJwkXGoKeFkb14ranwA8XQBwDCdNTKK1Gbz9xiFTH+e6md/+4SOTGhy82b79C89EeBq1gwkJEoDApz1m4wcoHQhpmAYxJw24+35z7mdfSLDRehOMj+mwJCu+rrvJKQoU/9CacyvsX3sbGG2tdfHIx82QqHFzBKOiw9jAtWWDbhp4FD3CG0Dkbfsa8CF7LsElg8LQwjuJah01AwqyEtVAmfyZup4TUYOikbCvtXj/+PJooHZbodcW22LseUvnbckQshposIKu8CIL2xT2NzkpHA8wADZxYDO1hopmbXCN9Dz0sKTKOI/NdoqkiXTrZ6+z+5737TUotEzDF73rulxw5SLXl2vVizh09uBWvFaFW+VgAuuAg6x7Pk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(10070799003)(366016)(376014)(18002099003)(56012099006)(13003099007)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zjNu05fYrjimS6XfZLWB9+lm1+KjjQjIIMeLQ8ILNcxzpzn2HO6iT8Pp2L8w?=
 =?us-ascii?Q?SDB5pkiAtyjVv8VIv10nTuj3WJA/B+xgf0fsDT1ZVwwdWEJOwpby8T2wDOL+?=
 =?us-ascii?Q?7EdYb04Bazi4uEiVs/3la1jkyO5LcaC/buNpHQ+Wr/LRX3b2IT9r9mw2nizJ?=
 =?us-ascii?Q?WkMI5IcHv6iwjP8evUK2NV58cT4DnlplqHFaYTCKuglHxP1ihvcdlTL8xQTA?=
 =?us-ascii?Q?Yw63/4nMqywnlQbNW7Rm6MuV+ql2BKpk6RvyD53yp1VO03rSLStYuBPghbIt?=
 =?us-ascii?Q?Wnm6MBe7p1biTKre5A6hME8x3sjiUgGpNjVv/xGzLv7yySFrcv5baGOTisHQ?=
 =?us-ascii?Q?nmEQlf/FMIsGgKZFgNu56EVxWn/6bwxTsAB2Kjik2hSVTa4U9kuCjXul3Y4J?=
 =?us-ascii?Q?yjNRJcU0FrRKEayn9LNHsYuwVCdyAouygSmz7hT/CIh9uMNG7YPa0fjgS33n?=
 =?us-ascii?Q?nKkY22cv7y82QAxvitSfyCoAmzj5RWdEPRkUumoxiWH2amxwG1cQU3UiRPi9?=
 =?us-ascii?Q?iS4bQ1vHMslEN70TVYBlRYnvLyauGvY7/Tky8xBzbby1f6Sn6f+ITYewHomU?=
 =?us-ascii?Q?Sf5hfx8yLSNEfIIHDd7Qmp5ySoxSAHFg48AqMiL82tzP4v9AGslVIPLlZM1T?=
 =?us-ascii?Q?s167GYxkmBhvadwgD70mlTeoqzXMgANzuFTtwG42U9tppCa4M+x4ipDezGVm?=
 =?us-ascii?Q?DP6+b0nUByscMpKMSyP3EdPjmWofBHA+q+X+nwuIXfxXmV5LP+A6NLFYr9a0?=
 =?us-ascii?Q?xndxQAPlqM2GiJJUkwG3HCoHaReQR7nCf3jkPtmw690LXVGlFhAnEJGOrEdA?=
 =?us-ascii?Q?9tRrjqzmAprWhOmbCKO8cVUNIguLI9r1lQmDs11rN2lEyYywrKj1UplwqHQ8?=
 =?us-ascii?Q?Sd9CZNyvTzQKrVfMC+uSK0atEYOqJRLRxteHUpvO/0aktPkQjxw6K1zALTFB?=
 =?us-ascii?Q?ci7Lkl7xYfsXQ6yHlBknMnQuPnnB7E0fQyl/gZLfbmGxcj3Gl6SiZR4XI//a?=
 =?us-ascii?Q?7bRKvvOm7/jhd4vTT/RIzo9LFzd4wLNY/HcqNqjnEKHYx8oJEZw4gmHFa4nY?=
 =?us-ascii?Q?UcicC7Do0zjcmPH+YhTnRv5im4mz1LgEC+3e0S1FniK5ath/X+/whmsIJSzI?=
 =?us-ascii?Q?4w/0vLiDS0sHhPlMYX3IQ29+bAps18mAVZobPlM6FUK3tv7gPPglibhgtzMj?=
 =?us-ascii?Q?GGBXx2PoVJ3x+pEMsdZjOcTEElFkRa4CggN1SBYXsoZVB9lvpRC+uc2rvIm5?=
 =?us-ascii?Q?ENcqzY0SeQg3AS3A64ShZ0u2/Ag+MDbqrU9f4Z42Bb2+HCrMsUMLgp7dons8?=
 =?us-ascii?Q?j/xnAwaJT/2GWYeGo1mnJY8k0QvdvtcmjWa3kpjoYNEy85oDJ++pYfTQgY+s?=
 =?us-ascii?Q?aEgwDjRUW115A0jc0HJ6xoawZpnxI94wgRy1uMM+LWCU8ciNUCSXwRQi4FPQ?=
 =?us-ascii?Q?T1W8NdeEUY1YgFQ5mkj7TNqXbX7TV39z0/OK5KWiOycPZIkrWxI/ssLgzoi0?=
 =?us-ascii?Q?081hH0KXvbDOZ+4OACTgj0yYHFnZcic457Pta0lFZFk3PbZ8EmjxLbzyswCe?=
 =?us-ascii?Q?PWDMAA5UYhTq61gaDsA6OPD48OEJQNFPxOrlSjJ7F/dym7jGQ7EXfwUqQLJy?=
 =?us-ascii?Q?Gmma7mqmyjMkVyt+DfxdqyzZnIz+ZA/znuYaZ3GIZAaAyXnm5i1YHCcdLq8t?=
 =?us-ascii?Q?4frYDPhrohCJDgJ1YPsNV1GjA2mc7+ODN6QYRLNFiCvDVGRiu1WKkmQLeVCp?=
 =?us-ascii?Q?pOMwlPldO27f1Ef9VBHQ2XSxAvyghhmd+NaOvcX490/kAmqpFNWT?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: dcd27d75-5d48-4187-164c-08df05227c82
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 16:36:18.6632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6hzxa8p7K6lVMNOU7C7nXpPmSvmFzmnV9HWjSWLgikE1DFpFuit09hwyCOLkPHDC9Kz5QqzKJAYR7G0olxcPZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB7093

Hi,

This small series contains standalone refactoring and new infrastructure
for dmaengine and dw-edma.

For each patch, the commit message trailer describes its provenance,
keeping tags (incl. Reviewed-by) as-is.

It prepares PCIe EPC-local DMA channels for remote use. For context,
(b) is expected to be superseded by a reworked version of (a):

  (a). vNTB-embedded v1
       https://lore.kernel.org/r/20260312165005.1148676-1-den@valinux.co.jp/
  (b). PCI DMA EPF v7
       https://lore.kernel.org/all/20260813063757.3131865-1-den@valinux.co.jp/

I will post a reworked version of (a) shortly. It will depend on this
small series.

Best regards,
Koichiro
---
Changes in v2:
  - Split and rework vNTB v1 patches 1, 4, and 5 into this prerequisite
    series.
  - Fold in the relevant PCI DMA EPF v7 review. See individual patch
    trailers for details and links.

v1: https://lore.kernel.org/r/20260312165005.1148676-1-den@valinux.co.jp/


Koichiro Den (3):
  dmaengine: Allow drivers to assign static channel IDs
  dmaengine: dw-edma: Configure remote interrupt routing
  dmaengine: dw-edma: Account for the MSI vector offset

 drivers/dma/dmaengine.c            | 13 +++--
 drivers/dma/dw-edma/dw-edma-core.c | 76 ++++++++++++++++++++++++------
 include/linux/dma/edma.h           |  6 +++
 include/linux/dmaengine.h          | 20 ++++++++
 4 files changed, 96 insertions(+), 19 deletions(-)


base-commit: 0d995da5fb97e8c312834575604d4423eb6225b7
-- 
2.51.0

