Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021140.outbound.protection.outlook.com [40.107.74.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76965370D4F;
	Fri, 17 Jul 2026 05:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784264612; cv=fail; b=pW6asynK06X9dsJe5hLpOCKmeDM7pit0VlFSiWEVNk7oJXIqcmUsfERmFTaMdy/8mov49Kcdmu/WBuGzADh1K0arNTcqCPUIjr7AtPUT8rBy2IIYPHFcIbYpHwvDRmsUREizMEpCTy1dQ6HtMR9EyHiOaJQRTdxAW6wuuLlqxg4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784264612; c=relaxed/simple;
	bh=VzcX4h84Vk/WKYqVAvaOLSSRny95VN+H5FRjMH01jkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NZbPxHdLGjHVTisTiT+f66NxN5Pkhb6OlAZgJb6P0fqCri7UwNHBRx3tTce0qvqrmOheReuHFAPmllFwhQTK5Lnv3FDhagLQyp90+EWk+N3Dgd2WWL6xq/5UTjJ0fS9LnWKQsxt+UByDprrPpSWz6CGPVlgUbCuI+qFjd8rYn/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=lRTR/lRU; arc=fail smtp.client-ip=40.107.74.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="lRTR/lRU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c+pEOuP++f1fXaI/HiSkDpn5SWJindykHJU/qwBtamtfwSnZ7/caXIN9yz/OWDC2TznPQgK+9jEZKSglwTgEEcqFU/bcUgd+hsVV32rRP3hqJBpvCHbCstMSVcw8wUDnEn25okzbfHUxXhr/2r+JwfUkrAw0R51F3iH/PKxAuQ8fygr4BXyVlkrkn/LUgsIF8Qtx19+gTnadRUgNdh/7m/xvR5m4can9mrbuEIcR579nIUAjgTpj0Ky7g6oFtg3I3uSrr3pCfpQ6eE+wp4I9F6DoLWC7GmW2XFFxlaCtS7R+xmw9KsSXUpkhxQfy29zKIBG2K7VPE4Mh7JQwMsU8hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XOdLsWvqrYrA4y9EPOfHJqf/m8ALuyBSKXSHq+olpLg=;
 b=VifrvTD5vUBlAajIhzCE28GPFjv2j4TIH2Sz+TsFDsWSGMVxiMYflEbFg7NsVN2yrIUPuB6KJDN2dthvBa+iAJT65jNabeoWYUx7CQxxUmpiTTTbFLioYTt8EvRsrl7KyNwXm24EXL3wtSSH67+t9ZfR4LnILMg0Lx3ZKih4Q9GdDFRlElU0yoUeL7PW1pSrT+NqE1UhML0CidrntQEI2tn9gxMdhO/lCEU0WSjjoyrLC5hFiazD+kOjUIfgvOrQBfP6vfpAmQO1WOBoT6IASVB092TVsHAKKYG4gDzrKixpZ1Bo6VRxm064zEUxF2tkapa7mbxRYhu3Stk8e5MCSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XOdLsWvqrYrA4y9EPOfHJqf/m8ALuyBSKXSHq+olpLg=;
 b=lRTR/lRUy95ofKv6bYYOFOcxrJ9/XHeEd1Pg3c3F0N6nQc7NZf5eeLAg8if3iiobOL7h4TLoUY0U/RU4ZVgnLpVLZL82Plw/c78FQNXNHMeRlaAr2vDmbZEDNB0a2HlBlfrNPOYVS0DQfnImmKTxlwyPvWwSlQtJy1ehZsuF52c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY4P286MB6313.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:33a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 05:03:18 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.008; Fri, 17 Jul 2026
 05:03:18 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 04/14] dmaengine: dw-edma: Initialize IRQ data before requesting IRQs
Date: Fri, 17 Jul 2026 14:02:58 +0900
Message-ID: <20260717050308.2144108-5-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260717050308.2144108-1-den@valinux.co.jp>
References: <20260717050308.2144108-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0055.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::10) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY4P286MB6313:EE_
X-MS-Office365-Filtering-Correlation-Id: 138f6ea5-eb42-4860-9794-08dee3c0b738
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|366016|376014|1800799024|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	R13XGK60YuteFrNOj6Tlxe7pWp/060pA/llJhd3HNjywUHjr4n6W1Fmvpnmoxfy4ruPIaRosHlPrNilC0tJ2246i1ro/iWR8SJuHcMdLorkF2Su5olWK3EM+Am/wOA/A9r9jTfDxcDWk3+LHgvCQvRw3cJy+2laI3BF826oyGjiaCcfnJYGymduETzipkrWu+7ziVM2eeZz2zFSZfMZOBH7wX7BHAAAu9+6Ar0uq44VpGKAVe33QFTbY63BY84apfIwgZBVMkqqkPCVMAuBbLXnJG5mR0SDPGjro8qM+RGzx0Q0sRxPP0l7ZXvXYtMlEXfUP1mPuxJSOjF4oxOyN2w5qKUOSnkTZiW1WPnoVTUOSWnnqDrh65pJNodBdoolbnzOgEo42WMMh2e0/SV9XShPexh7xonYGi1dsUWVhlH4kE1x0rzR1FfaGivGgtqlmzhCp3LR9gUx2gsDXRlZIYrllsczrBIKJr2bDApn1kaosaQR+nsuX2DmJacSV1PMPFS8JSA+J37rGv4DbpHqwRMq6qk0ruu2vV+uoTY4fUEVUxNoFovPfMkpMP+vi2RWFartYyb8+8au3edvXuJzxwllC+8FxHmj6loZPuoQcDOGpWiY78LvSfZnD9x3UnFEJDOrp8EEs8A6iP4ZxkKvyHYrtkJNE+gvjsjQMTToDooc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(376014)(1800799024)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ShD2tjQ5fkksXQLg5jzKNeOwANZTwTarjrZmgjHVRctU6bdWjXCvgbnpKz8B?=
 =?us-ascii?Q?7+EOztd8LEvN2rJO6zECBmAzAIP4sso29rYUDBXq7XOTcAa3YzNfZqYkh+KQ?=
 =?us-ascii?Q?oGoEpuXQZjqzKRVMqgrn30p+nuWxpRTDyJWkH8rlhpTWxFtUSCgtOQ4WOZDF?=
 =?us-ascii?Q?0KEg/p2wy+HoyIX+3C2xgBY4JUdyCynvvGZLmVRXDb+FltBo36ENRTdpQirf?=
 =?us-ascii?Q?7z6MrzLaBmM9aMzNSqoBvryzht3vDaN4YTcAE/+Bre5NxUO032euxctwJDls?=
 =?us-ascii?Q?AykoTiHb2rGX7GrST21/iaf8F3zQrBE8LHLgJPQPCvlhim2GzQJdMaalBS+G?=
 =?us-ascii?Q?4qXDJcMeXVxKEKW/ekZsZwY6tndlefDqZnvgk3iiMZjmQ1339ww2kjp7URC1?=
 =?us-ascii?Q?QXQl5wOznpq4RWoVTVFAStdmAbhQ6n2/9npSUuOcRbxhA4vPU0HrOG60ulyw?=
 =?us-ascii?Q?MeNPwFt/jIiIHiNLIL68vtgSwdvUtF94qGKhuw2cHlU9zOMqZgerSyf7DWo+?=
 =?us-ascii?Q?kXqy+tQr9spqTTrpFfVYQlpwdU8uIcpaG6IVM7Ih9r7WqtEbgYq8kdb36aux?=
 =?us-ascii?Q?KdvXioF792rS3CJHG+VPxxGCb55WJHKu61zz4Uc8u/sl4AR2meM9KLVHl8Y/?=
 =?us-ascii?Q?b2wag889gTwEXsq/rjGsYNA+OKQza2pkIwkiuPk1WjpFBoHUw6t+oE+fQvlI?=
 =?us-ascii?Q?jibieZrGEuNFFSpWXb7vzltecViURMrMoNrgsI3eCLE1RnE58penjXKCQHgz?=
 =?us-ascii?Q?Mf8/F1TLHCDrk6npWB7prsmMr+jp/XAKDyRb6A002LOX+qffPdFU/LNy8eFy?=
 =?us-ascii?Q?uMJb7tDlJQhYkC/+JBhviV6REUkphOjMFqzG7o3gLoDiGw7y6zzFLkwnQHxx?=
 =?us-ascii?Q?6tFPmzJ0yl5xRFoyAkI48C+p+efIJQvK5PUCH1UqkYxj0JT5FNToXBeuOjAP?=
 =?us-ascii?Q?j154cmDr/hLGhr9TBQ8r7VHiDJoYJlJk/6ikMIpnnWT3gkba+vd8IsZSbpT+?=
 =?us-ascii?Q?IbkDaf915f9yjLDsm71EtXk3NdHvw7W1GteIDr5o1aAPnOSbz0fs43tEPK3G?=
 =?us-ascii?Q?eYvDeVMdEAAboZ5KjYOwwkfWRTpjsGyaDNJGFJsaGbh6rWb9FPKMBBrW2UDu?=
 =?us-ascii?Q?StAjNVshFFZ7CiwzYnsu7m1Ess4B9dm2WzY1TOPJLcTYtqWdrpCkRgAFL5Iv?=
 =?us-ascii?Q?AyDiMUDy1P7mDGZ35DsThWX3Ng5sF09aVNp9dncjIqh5s8Q8TKakwdltuyip?=
 =?us-ascii?Q?0Eq+54mWZ7OFJrvqZS3fhwujmY7TNkAeGn+KQsUdu+Nqy2KbnANu/8xcDCIx?=
 =?us-ascii?Q?KlI20xZAFGJ7pTfSktBGYKe7WpkdHkUBSqSMBml18Q5gF8Pcs3TzipbMcMUc?=
 =?us-ascii?Q?zfNpUp4rlQzua4xLluYzbxd31H9qMptAakLdT3i++CFUrtg5y2FhMavwaV2R?=
 =?us-ascii?Q?cBTgD8PwCKJ5sPLXMCScjdiwGnZPF9953PXvV5aG9dblsjldfRMzUN3JRpRn?=
 =?us-ascii?Q?j6+aiyKrxOyI7ATniJ+KEr6zSe2sXdwMTWy6+SnDHaDdMPubaOglE1wU7Q1B?=
 =?us-ascii?Q?yM35FpURwp1DoGn7Tyr8Lh2B3i3QUgC2sGdNog/2eQpyUkPSz0YTmn3+WJqb?=
 =?us-ascii?Q?OnZf/FFtvv3W0rgIxUYHhXuZUH6tpqddg3Ra7yWbJvgubNSlGzOv+GAGOmhO?=
 =?us-ascii?Q?pFAfu9visZjw73CoJng12mfFgvQt8eTfuDPXdbYEyK+xMqN+8KdL+FvU9peO?=
 =?us-ascii?Q?1n6Nbx84uLGMtF4nvM0dkFnrmZwayoWv2V4H2mYknz4wPNUntPM8?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 138f6ea5-eb42-4860-9794-08dee3c0b738
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 05:03:18.1245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nGVIbkSR/VCQIaCcakCdS/5ncmtVWzEqH1rxfA5NA224dle3Ib3LOEmUUNFguY3WQRKlQqiOhgWGCUtTV2bCvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB6313

dw_edma_irq_request() passes struct dw_edma_irq to request_irq() before
dw_edma_channel_setup() fills the back pointer. A shared interrupt can
therefore enter the handler with dw_irq->dw still NULL, leading to a
NULL pointer dereference.

Set the back pointer before installing each handler.

Fixes: e63d79d1ffcd ("dmaengine: Add Synopsys eDMA IP core driver")
Cc: stable@vger.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v5:
  - No changes.

 drivers/dma/dw-edma/dw-edma-core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 8a1ec0fd057b..392981f3b7bb 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -854,7 +854,6 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
 		else
 			irq->rd_mask |= BIT(chan->id);
 
-		irq->dw = dw;
 		memcpy(&chan->msi, &irq->msi, sizeof(chan->msi));
 
 		dev_vdbg(dev, "MSI:\t\tChannel %s[%u] addr=0x%.8x%.8x, data=0x%.8x\n",
@@ -935,6 +934,7 @@ static int dw_edma_irq_request(struct dw_edma *dw,
 	if (chip->nr_irqs == 1) {
 		/* Common IRQ shared among all channels */
 		irq = chip->ops->irq_vector(dev, 0);
+		dw->irq[0].dw = dw;
 		err = request_irq(irq, dw_edma_interrupt_common,
 				  IRQF_SHARED, dw->name, &dw->irq[0]);
 		if (err) {
@@ -957,6 +957,7 @@ static int dw_edma_irq_request(struct dw_edma *dw,
 
 		for (i = 0; i < (*wr_alloc + *rd_alloc); i++) {
 			irq = chip->ops->irq_vector(dev, i);
+			dw->irq[i].dw = dw;
 			err = request_irq(irq,
 					  i < *wr_alloc ?
 						dw_edma_interrupt_write :
-- 
2.51.0

