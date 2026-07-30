Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020115.outbound.protection.outlook.com [52.101.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FEA435A9E;
	Thu, 30 Jul 2026 16:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785427643; cv=fail; b=g4N8mvntlATa6uUjbWIuIRpt6IAkLdX0MsQ1wAgCfCCe18jSH+8ERUiVzqDAFNgGLXlgkSuDRwBVR4cjk/MyaQkaTYxhPYZIiXUC9Pyil/7AqMpy9d+K/Pbve69NbwIT1UuMqymR3eeMsC1A/XD8y+/SjyZ4hJ4nxtkuqkr7390=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785427643; c=relaxed/simple;
	bh=1BUwLHhAH+FSYjPDuMWu/eW0bRdDDDJBixQgN7Cr1Pc=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=aT8M9OVprLIaeGz6253AYuTLE2pHxC89983bjXVqRejHZ1c7efORvMLLSddos7sQhYOc9waPys3C+IemR/mCfIg//laZz4F6sg/Tc9+qYNjhvz+rDKYXlGO6atQnNNNMWQgYS+DzTrHTvUSJ1pLtM1jEOx2r0v3pZWaPmfqFBu8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=NuUctPz6; arc=fail smtp.client-ip=52.101.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="NuUctPz6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HduPFlkzz/WCUr6a+KjpeiKfXbtDOmUUuPR8h3pgtXJJIsUY0S2+HlrXef57BfgJNbACezTYncSQEOp89q95llGPlyDH7adyrK4jXNcRIMvQH5/2n005s0SlKteFHbpd34hkvpz0D+9Azp+3woBb2tOYA8YdqWUbAlfc9zkd+nLSSgV/R6AbOrSsj8mDN8davlkb386SulerLKEWrzKxgob3dbk4BZ9AYAsDw7GvAiBpw2JhGo+Q+rSfUFGuq/PeliFcxD4ZcpX0RXVTieBYK7r+PXCwAYveRUvfxftiIUasgslS2gjnoxppZWYWD/pHlK3pWSAEG/T3h1N7AmNsJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6L8pK4OvskOeVFQ23R/S5VM2e4X8BNgTI1Hox7UEtg4=;
 b=MidFeH90nQuLguIyG62/n45SKKV0FrRDCx0HHrhRxadVm01AwFa1DniCOlRlhAu8IbwqRElYmWrF6G5VK9rlz//NS9f8WhsaT/eWb5Mm+XEdKD8987bPT2ZlaYsflOiLT9O8eq0MyK4LztRcpoJRgPkkH/ikz52j8gM2XOxWUG++iJbB6CxxEgaJuzSkneoiLbnVFbhqUfsR087Xs/AOID3MzOo8IgDG0VF7w+ayb6TKoV18fPP/7CYz7UepMLzwloBcOm0w3bKIenTxAQWGwww1TeO9oXTuLU5VjMjXDMZvo7RirCoFTl1ZlqAGU7AFIj8qeecE6z6sKHZq+ovysw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6L8pK4OvskOeVFQ23R/S5VM2e4X8BNgTI1Hox7UEtg4=;
 b=NuUctPz6g8J4V/64uAB1Uyhz0R+gxGxN30QbTd8im+44QBbWajNULv1U99b8sFSm5Qh8xtqIfS+j2qrq4FAYL+iirUGCjWVxhVk6bHFhegILireMkpWzt8g0EUYFtF1GKcshRCQeXlMtr9QtRLfFgxj4m7MMhK6upW4RI+dcVT4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OSZP286MB2395.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:15c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 16:07:18 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 16:07:17 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dmaengine: dw-edma: Mark emulated IRQ as level-triggered
Date: Fri, 31 Jul 2026 01:07:01 +0900
Message-ID: <20260730160701.3550710-1-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0074.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::19) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OSZP286MB2395:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d97aeef-a7e0-4b23-dabc-08deee54a0fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|10070799003|1800799024|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	8YMppoWG1RH0sfHSMl6zpm6ixiKMDSrDCLup5fsaYvL+a1xWyHbyYJKe9YRXqpIN/uW4zaea6pXrqmRcua/tOZJSnpBbOcDRcDM5IqF6HHWKXho3zPvftCzXs1aABnl6OWPdFL23mmLMYe/38Qgyj/marjwTVtJZo6NpK2XjETxBf8YyPiFMSN0B3P6xU2oSYX7tR/6SDlCp0ypDdoJB6GIOi2haNfAH3mmSLGN9MkFvPUEVeIkwlFKKWuJZso421yin20zAVvy+gZe8ipsSkxD26nHT/ux/DdIxRytD7szGTFaa8VgpxztW8qmg0eJFwj8WtwVpZuly5SD7UiopjNDtU6dpYlwvBAwX6cA7g2GYw+IP6ywZDk5Pl3Hw3PBw/sErVFF2J0vEH2OtPIsFOnZADvFQFY2D3RuuCOdPIcrMufr6DU+Wpfx+KmZMHu10ByD84YgVRfJWCb4pnAOQsOvEtve/4PtaaxZlfU0QdNeGVCr5z7awtXGUPBd62wlHqBgbSY+Gk922zyBExgDPjQHKqBPHJusl2VFwO8koziWX+kcdSyc/LsDMjnCYKJ0PUf5aa/xpyoSUPo4oVOzw4qIodRb2I7/2DZjReodrLBK7o/5OBv2PV7tVTwj4wUvusL4j9fsGe58svN8uyx9YF+ZzI+nh+70kBIqN9oxY5GQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(10070799003)(1800799024)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7BhN6Sz+eyYEL5brYbAJeGv1S7pbXTb2IR+xMFV7QHIXbbCAjskqwNcTaoNU?=
 =?us-ascii?Q?vmxjcC038ULNoKHrih9ONSFuimU+RaWgGbaKWX6GnpKg9HkzVvzsX6/70vx2?=
 =?us-ascii?Q?lJD4VVjnUdEQ10ny7/svh77wOvRhoNgIhE27MKBlcOyTx4Loz1gsSgJYPqZ4?=
 =?us-ascii?Q?uHrFkI82Za4qAp+Ehs98E/HYOmW5llgb/u9m8xRaLpDP2DfESmmL0ITFIk0X?=
 =?us-ascii?Q?QsPZ38yvq+PQRl+OaYxjp6nI4lS3g47L8cxu8FcVLHotAfIAFD1Na3svdnMp?=
 =?us-ascii?Q?kIZuSSH2apLuXJDavParpTiyKiOFVTIiXk/ptDgtOVLGnxPClXtrYH9kN3++?=
 =?us-ascii?Q?AlBCJV9ArF01+zs2y566S/TvTRooph49FYxZfPHainV1KKJt3hyOxuKy5pg0?=
 =?us-ascii?Q?6IggzkywjPaOsDTSJdxBHqZio9EPtFlAEhgkUsqzhC3hlykTBZfs6BjvbpfS?=
 =?us-ascii?Q?jNLW+hZHLI66lzvDrOPY66Rr7ETNZOyNbQ+zoeLAUANGcTTOekaQi70i86gg?=
 =?us-ascii?Q?TofPIOcROpSYnpSjrV8B8xmwHFt0IVSqiaZyKhZIQKmY0sbm146wLqSlVS6z?=
 =?us-ascii?Q?xudj/nTe3hawgSJRbOgB3xMapa7OpTuwBCHw4f5O6F+6hOvY5vRuuFD8OlV8?=
 =?us-ascii?Q?p5qGgmf47UsUbeUySDJ3DW1Rvw83Mp/TzBLSToKHQvwlXoNhb03YlFbpjNyo?=
 =?us-ascii?Q?RaZJSaS4DvXSppiX6+K1NZ2RCTfnu18O+Ie0GkIDqw7myj2+Vcv6BAZ7IjGd?=
 =?us-ascii?Q?hvnXxRlO0+VpEdauuRCsmTLlOYd12HXNEZDgGuDXzMiXgE5MZlkQt+Owu8Iz?=
 =?us-ascii?Q?b73oK3CMowAbJEX3Wi520nX5rnSh4RqbYckks9oHzEg5rj18jZUg1Kkp/Yc1?=
 =?us-ascii?Q?Nkd3I0GxbqLH/w18P35qY5Hfecv41hRFW1tRayEoL3PxOUYkDmV3bbjwZ2PV?=
 =?us-ascii?Q?gT2mJvRa1sSF9Va9NIB5CD7es0DZDW/XFhHec7wOE7wCHGmRU3gwqzp0cvVz?=
 =?us-ascii?Q?SkZ0cM8oodcC9oK7zjroMBL4YgZSeoqDEpvz4qHUoa9HFXvMWNaC1SMxprjR?=
 =?us-ascii?Q?ThWt4BNpIlwCBBuIweERY7lxEAYUNmiXfWvH+s5TcSR7c/hqdqZ7dnSgy+le?=
 =?us-ascii?Q?cvZXS/KvmG5GzwaDbkWijQ94mu7ucjj1zmoPQBecdfKo2y12pqvS6zoMZDh5?=
 =?us-ascii?Q?dPkmsjdMq+YBgVPUO8PND7HirVw01tUqXWKTATIMZeert3MhpFxBz+bKmkXJ?=
 =?us-ascii?Q?pQKk5AhL0FOyKd6wtfDml9skcqVxHmE/M281cdjCyvM2eOFoZJ6yaUeUOuMI?=
 =?us-ascii?Q?Pxjf/BMVKAV2nmvsiWlc4lKgnFW5MoVYJqB6sGbwaJvidLeJ3EVWIQwMkjZJ?=
 =?us-ascii?Q?tMt+6Ku3FgPPMuW+og9h50ncBZIlqKRr9NxhUlWmAZU2ktv/OnVSCDxjF93N?=
 =?us-ascii?Q?cdZTGHa15TYZtCeshZaY0nlrGlgindF1NZX6DIEfVSinoaoe5ZxnX6ieNrU3?=
 =?us-ascii?Q?iR8v08rm/VmEFVqW9geBDFrwwH3iXey1T2zrMd9DydCGMVYdwDY7fLVvRyX4?=
 =?us-ascii?Q?vYEonejbit7erKuIXsSsXFYDChoA2pN9s1I8xHfpruUJXSmls1cdFQIvg3NV?=
 =?us-ascii?Q?PFVDbhEmfC/HI12AnhVrXEnibeeIuVLdum4eYxjjMboHKV7qtldUKO1DbhR6?=
 =?us-ascii?Q?0LjYrNmii/co+jLQgMIe6MZmr/xbH591xvEBIXKztOn9k1NgB8OsN+3Q9ih9?=
 =?us-ascii?Q?7kJlpPueEShDSLKjo91mRzmaYDn6mdGwTXlXX3m84A6KVMblEANM?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d97aeef-a7e0-4b23-dabc-08deee54a0fb
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 16:07:17.9342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zs8sO9ri3z/Ms9nl9qVSmz1wFKZlmaxzBXFzIir5oAvforPzbReeoIMSXfazl+I/SePYmIku8AU1exgi8f7n3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZP286MB2395

The interrupt-emulation virtual IRQ uses handle_level_irq(), but the IRQ
descriptor has not been marked with IRQ_LEVEL.

The interrupt emulation is somewhat unusual: the eDMA interrupt handlers
dispatch the virtual IRQ for every edma_int[] interrupt because software
cannot reliably tell an interrupt-emulation event from one caused solely
by DONE/ABORT status. If an interrupt arrives before the doorbell
handler is registered for the virtual IRQ, the IRQ core marks it
pending. When the IRQ is later started, check_irq_resend() treats it as
non-level and replays the pending interrupt, causing the newly
registered handler to run for a stale event.

Mark the virtual IRQ with IRQ_LEVEL so the stale pending state is
cleared without being replayed. This was observed in pci_endpoint_test
as two doorbell handler calls when the DMA-variant test ran before
DOORBELL_TEST.

Fixes: d9d5e1bdd180 ("dmaengine: dw-edma: Add virtual IRQ for interrupt-emulation doorbells")
Cc: stable@vger.kernel.org
Reported-by: Niklas Cassel <cassel@kernel.org>
Closes: https://lore.kernel.org/r/ampndLtU32ODmncX@ryzen
Tested-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 drivers/dma/dw-edma/dw-edma-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 89a4c498a17b..ec097c68cf5f 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -755,6 +755,7 @@ static int dw_edma_emul_irq_alloc(struct dw_edma *dw)
 		return virq;
 
 	irq_set_chip_and_handler(virq, &dw_edma_emul_irqchip, handle_level_irq);
+	irq_set_status_flags(virq, IRQ_LEVEL);
 	irq_set_chip_data(virq, dw);
 	irq_set_noprobe(virq);
 

base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff
-- 
2.51.0

