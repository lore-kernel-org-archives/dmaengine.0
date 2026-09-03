Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021106.outbound.protection.outlook.com [52.101.125.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D76B349CE2;
	Thu,  3 Sep 2026 06:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788417964; cv=fail; b=U+f41xiUkLcMrNPZFooOvf3srqLvBs/8eUVuLPC/nZrmVLywGrzq8wrB2mj5ybzivRXO4uEpSM8QwWjTAKiS0pppjzhpIfJ5uwjZXx09Ris5xc2KKiT3kKyTPMRYZ17TB/SS6cP7fNp/imxQR00ckDKlEAxt089z4bbWIEFyBlw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788417964; c=relaxed/simple;
	bh=bGfwnlJqK8X5PqsNMmh33A8vGn2VuAdEIVZNODKTno4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=b9tp12pcRacevzYhapMgiTvdcBbNpm8mb90n0wOzkQnP8s5kJv1TvcqoP7PI2II4dYqEjZJH58KjCbDwICM2gcxYWl6IsURpkYv5sBpIOIvX7DOa6zeFgKsjdqzmy70s6y9N5IdQs6JiAb7AAEXsfh/Y2DOWC1hu32tciQPRGlk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=CuKuk+ki; arc=fail smtp.client-ip=52.101.125.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="CuKuk+ki"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kiE5gpwYHNofQrefD0KIpQQj+9OOUQX7fQR5FCkEi3B5fteLSnbEtLi2pTlLX52++tapeLL5AL13hkHD7xj5s12cExXJCvl6SBI1tdY3vcw0Z9paU6RHDUSwG4ZEKm3t9RBzmY9+lOXMeRAYO1LsgMiDoZk2YuN3qFww3+VJEmM0C86DAdMEb3VUMkzmr8qNUOQwc9nSiEe8TyZQkXdregnQogqOWeL2EZRL2WU7hXAnwcU3ZsPsDzvRlPNqfNOykj0Wdp5NfJehmcaVIwcaR/zooBJgecMQZhCSXAP3kJlqYoKszjzYhWPlQ0TlHJ883CQSyVRWBOs0f8fhErdNsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2lZ5KwBpWmqZiNWiApuuBp0dvsXQpCYFAp5HQ9QvStg=;
 b=ala0KFxv85ogxHY8qnJTFhTa3kThtmSiKbZ/gmyCb+cnokt5GL1C8uKDnv1alw6YvGTBb0U05B6woqkOjK/6yPNcI1Pz/grWBjojestEpZfYDnfaVi5PvpqLrcNIo+2pUmLaDlWN+iculxscEpAyuHWY1mk7QBwF5Eh6QG6hnr7Rf6hmfjiFvx+WAzW9TUCwyNItv2kxZMsVKg7OyWPNWxt0+htZhZPeGfBk7jPXmV8upRWSGpQQkDw/cCt5k7NS4XnGt8GtRnFsi9Rmc73zd/dgV+lZftM/y0IxCqsmz9pwSu4m5uDVErLxu/5P3hwlU9JwjwBFtLFkZ2vBADfO4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2lZ5KwBpWmqZiNWiApuuBp0dvsXQpCYFAp5HQ9QvStg=;
 b=CuKuk+kiuwrGTt71xr2p//l5ZSRk87FjO4arClxuqPBxAM5KdhnQEzuwquwVC4EbZX+Aggn2NcNhCw1bJ6SJPpHaIhAAcqzvwlGOUXEeX7/dDmiaBcNYuecsnpon0DJZOcNDQ+iTwwI5pAQEBw/TbXzWOfGBJ9FxaMH4mykw60Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OSOP286MB7980.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:479::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 06:45:57 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 06:45:57 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Devendra K Verma <devverma@amd.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] dmaengine: dw-edma: Prepare channels for remote use
Date: Thu,  3 Sep 2026 15:45:30 +0900
Message-ID: <20260903064533.2269557-1-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0170.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::10) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OSOP286MB7980:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b5ab4ad-441a-4af4-0f85-08df09870277
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|10070799003|376014|1800799024|6133799003|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	/mAoXbZVx16bupgsW13aZAL5aJYMWDuExCRHNtZHKhN35B41lN8CMDQ7EDKkXASK2V0sYvXxwUvd6gwWCKbDl/2WTR27Ku3tEqFDmcHrA+W2kru5fBq0AWB5Rc8P+ZwD3mQOiOFrAhBPsrBKxZzGdC/HPJ1IUg6YyoukakAIbpOsTm2eQOWUh5QKbySXWJZfqaNmVIklF/PFRzMbYWCwt+0mMeDEqQAZO1cD9Z6foAPzsaXId3FQiny35XPaxr06V1UgYW3lp0lp6aN5hbQvYZBOmxL7f1eVddub2WdO/Xm2fbFHHLGKQ1TMHmSyQhlDNqfMtrIMZ+FsMqmIVxwfuyBu7vIAZXsetOY65OzvlDmFixO5vaHlJfxUySaqjzgUWqbplSgv28IHl4wz9TUoewZZ4p7nntQ2AWvtA2tfr2DGUy7gNFGMP8Nc/6AX3tnKnE8qwkaZvPo35pE1mdLYI/Pov2wbbIdiXbmj2hgmLcWvqOavincLFu1WzUKNUfckEPz/GF8PrKIDn9eZaNeEOL+64YPcjs78K/P+r9nFAAWMoLFlFl/0yOilKHIkzA5za9S9gFesb+2lGDkv33Vl1tDUcrXowJpd4jiFowaWBgUCuT3cqajkSbELH2KjrMPd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(10070799003)(376014)(1800799024)(6133799003)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FMi4AZFDkPOQkuc2r73Ea70YlJbVnvnx++QkbTII8ceLRRGGLvSkeGOw9fY1?=
 =?us-ascii?Q?iDq7y9cK8kURfttbXNjXJ1Zu/fryvfjaoHQ+UGqzemz2JXtRdb28vdYvrX9U?=
 =?us-ascii?Q?lOx1j9TrX2IRNNF+UWRCWzqgTbp2XFIbcHrhEhwPjW4m1JdUZ9CHzuDyHQzd?=
 =?us-ascii?Q?5zcijcfOL0rTx7IzZjKpY+73Ab0g8NJyNkgPovTjkCAUo24mGTnn99YW/Pn0?=
 =?us-ascii?Q?nU137DRQ75IU+dC7xhYYtuqohoT6Dtt7+ilbz2UVKP78LhNSXRRsJ5ylhLoY?=
 =?us-ascii?Q?wGY195uYzC1nkddw5SMNqb/vvK7y3aCj7SRuoAO0jDaAkk0milA/4+NmkQUw?=
 =?us-ascii?Q?tCXEePq4g92hW/sQhvtLsuuZcIG9SqLj9VOkcYtTBNGqLoWRt1RUDTc8kT+B?=
 =?us-ascii?Q?s50Nh80sRp1AD7UqA+EPBYtLq9ODQeCdjudCXAaQVK3wCsJgs15mDuwyn3g7?=
 =?us-ascii?Q?iwWX7iqo+YSOkCWh8oafXu8aBZUjqFalchYVT4lk7KlddmUqex9tGnRsE4rS?=
 =?us-ascii?Q?Wa0+CKhUSGR2jOeTvaxn7b+O1Sii1TNNFISj18jfL5IIDt6imrLLSDS+ervn?=
 =?us-ascii?Q?Czi9149bXncvXbL06XrWIIr00k8M3f2OdBpd/WPWrSQBeziqPkeaUK969LnB?=
 =?us-ascii?Q?E5LuPyOBeaLz+ID98OCTmNGnZIoxZbPGiqHh1Cu+4xhus4m9riQMrzXP6eh2?=
 =?us-ascii?Q?d46CUAKhrqbDYIM66E8OhVlfUc+r+bBMO+ss84ffNJw5Z1vnhQVY91i0EIyC?=
 =?us-ascii?Q?jM4AeOqwSCltq3gxRGHGfUh+nGTVKY24Ets8VsA4N/HKlrYk2VJUhjX7zv/j?=
 =?us-ascii?Q?tDmqp7S3s2mAtH0jOQSiYE3Yxyc4qs9toru9OyPNiFMJ0b5Gl+wwpCFEm1r9?=
 =?us-ascii?Q?WChAl5keu1n8Sm6/BtECy8vpkN8yJQAVWxOXGVVyaLDCt6aX6FgdzbIrcw1I?=
 =?us-ascii?Q?STb4NI97xkF/0mhkBd0o8CszXTHQz9FxIt06XOw6FGA3TjkLPTU1zeDY6049?=
 =?us-ascii?Q?SSqfbcRc6/chiZN6FWefH6zl9O4RvZPuBTBLpXEvQGhuhWlmANURU7YId8wI?=
 =?us-ascii?Q?CDIU5QRiDl8TEaBMulYsKO/hzCJXkDRb6t2q3VyC7zQ8X5sGcXQ3GxpsHVlH?=
 =?us-ascii?Q?zze1n8AQ49wHjS/UsTMPuXEzQ42yc8nuFA82l5JCN/S7zCpJasArQHZ3KHBp?=
 =?us-ascii?Q?CExJd0VbCZznWIeevWzcWUJodR++4QEcShURf0/8MIybBOM8v3jVvLn2XVWr?=
 =?us-ascii?Q?MgizoDDGvgxRVENQmrfhlWu22/zHBP+lR9fnBRs8onA8Ihih96lTdLrwyT8w?=
 =?us-ascii?Q?ejxxAEoJ/Uq7AddEZ5SkYdk40tP5WFwfng1jsonLf2pe7hzpD+O8cvvap9U8?=
 =?us-ascii?Q?a2+bbMXXTRqP/z8tdkF/e+W7Q0n5TD6e3eFnex+nDYCeYQAQt61cnxjZ1q29?=
 =?us-ascii?Q?/iA2SwUvWzhExxUW4atSD0wJGPfTcaFkjlh52gLA9oSO2mKDem2YIewAHFao?=
 =?us-ascii?Q?mm4v1zMgLqupVEdei7VJib9ylUUkVpKzRjhMc+lsvmIbqaJVmXXAU9srOdP9?=
 =?us-ascii?Q?4PIZSCIobZkyowoWEjWlJkVQ373zQxDG1out0XA1FCL8bZB78UezQKtxYAnJ?=
 =?us-ascii?Q?cYrRTUIb21/yLRxbSSfXRUNPppzRuCv17zT7T0MecMViUCPWP89RCPteb7cB?=
 =?us-ascii?Q?4YM0scVuTq0oNFBMaUrNy429js1yKDiXauxICNTIJEzpdqMuXELaP0V2ZE8R?=
 =?us-ascii?Q?SPhjZ9pA3gV/7Kai4q2EqT2Za+mqD35wFsCEvDbSf9PHPDhKPHa2?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b5ab4ad-441a-4af4-0f85-08df09870277
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 06:45:57.7655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NmMe8mHzsMfzYsjGT+sArKbM4fA4erOoXkhOLM2+UZVa0i0bTHVWH0SRiIj0EJhssKsynT3uMHXdTyNVGmCGbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOP286MB7980

Hi,

This small series contains standalone refactoring and new infrastructure
for dmaengine and dw-edma.

It prepares PCIe EPC-local DMA channels for remote use. The upcoming
vNTB-embedded DMA support [1] will be the first user and depend on this
series.

[1] https://lore.kernel.org/r/20260831182657.329614-1-den@valinux.co.jp/
    (This is v3. I will send v4 shortly.)

Best regards,
Koichiro
---
Changes in v3:
  - Rework patch 2 to use a common channel configuration, retain generic
    dma_slave_config fields, and close the shared-IRQ routing race.
    (Frank, Sashiko)
  - No code changes in patches 1 and 3.

Changes in v2:
  - Split and rework vNTB v1 patches 1, 4, and 5 into this prerequisite
    series.
  - Fold in the relevant PCI DMA EPF v7 review.

v2: https://lore.kernel.org/r/20260828163611.2691264-1-den@valinux.co.jp/
v1: https://lore.kernel.org/r/20260312165005.1148676-1-den@valinux.co.jp/


Koichiro Den (3):
  dmaengine: Allow drivers to assign static channel IDs
  dmaengine: dw-edma: Configure remote interrupt routing
  dmaengine: dw-edma: Account for the MSI vector offset

 drivers/dma/dmaengine.c            |  13 ++-
 drivers/dma/dw-edma/dw-edma-core.c | 160 +++++++++++++++++++++--------
 drivers/dma/dw-edma/dw-edma-core.h |   5 +-
 include/linux/dma/edma.h           |  19 ++++
 include/linux/dmaengine.h          |  20 ++++
 5 files changed, 170 insertions(+), 47 deletions(-)

base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.51.0

