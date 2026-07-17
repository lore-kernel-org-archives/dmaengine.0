Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020123.outbound.protection.outlook.com [52.101.229.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F035237E314;
	Fri, 17 Jul 2026 18:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784311611; cv=fail; b=mztIw0eyMY69iblopMeEkHjBLJRwwqQMFnsySP/yBsYr1dMBSNI/8XqkdsS3vysDP7gdW3uOjaZpKvADZMItuVjDIx+/8ovgHEIzmvHJNlJZgTHvnBW2pBbm+QHtY8knTCW8jNplcTyQoSlRYFioGhcVSbd2MzJ91w5jTLmzXoI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784311611; c=relaxed/simple;
	bh=EoLPbp29VsqLDt+pHvup2vbO3DMGmDfAcQYwYQCmjl4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sqg9fFABeptVUXtIqJ+zK4TEO8SS8jsyoEPUkANbX4ZtQW3TH37NkL1I/RRIRVUAIk/IMFr1zUp7HHaCBnZxfx2pocsjFYjEP4VUCNp0perhamRNYjiANVS2QyMPCKmA/dAmcQ8mlQVu2JNKHxi1T8hIKC2zqP8bFsNS5sUuJu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=PaG7MgYu; arc=fail smtp.client-ip=52.101.229.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="PaG7MgYu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e4StgWE1rG130jmliZNmIiQWY7wFqLbDwKRWUJY6rHYjoU+QywxhvtamEEwJu+/IFEl838I7WHbSnhc7HGeY3jmT9BzeprMEipd+A2+5aW0K8OBhlrpq0suMyq1kG1SZR1rKOq+ZY94ZYfBJWXBdZLOoofZQCU2JbKnmjkKYZNOB1owNsDjrGT2ae3kt7m61mX+uzW/ospyz9KU/nQ/zI9gA4oeOpjui8NBKQAXS4fzHxA/Q1ECgKb26+pd0MBKZSx4nNXN+GD1GPVvLx1OD1yTcntvYusGCxB5c//QOjS+FS9P4dnZDqbnD0dp8c7GFq4xfNeHQ3498rmuMKbuQ1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fHNILRq9uZT2uhejW/7UCvHVThN9jGm9DXi4kRKVtPY=;
 b=CWZT9zgyqr2O033zznxNitsvt27wFp9MMyINlIrpPitCsQqtvDB9bExfU9uiO5bScURsq6nD/VFRy2KU7YGDCFYCjxGuIHMXnAVWDnl9Jhsft293xOWQjvuLBtI9AfpHfut4o1iAnVsrb+6xtwSVfI11C68wsdqIc1aA5UhKuWyjoaSeLHslhEPpxwWvHq/Ou04kR2xiimk7iaq/HUef9s/RQcsXnql0UdgA5uaZJtLoLMdTjiAqc/0CkYFFNgs4B+ZuXAho3chTDiqU1K30qpmg1/5ZNgo6u7TqXShE5WS5w6cjVXSwq9MlmCemn7OHXIpS7YH6n9uE80Z6F2BkMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fHNILRq9uZT2uhejW/7UCvHVThN9jGm9DXi4kRKVtPY=;
 b=PaG7MgYu0SFeP3RxHJ96uv9fAn/aancgGeWywhACPa8c2HIff+CieBLns8pBZ9csEffrSps1V3E4Cx8e0fjFY3tu7js4snm7MHgOXMiO1SYAP50TKy43y91XOPf9PJHomrGRos/z9mSZIh9ZuUoPPBw5gLMdZB6/aJ5o+4iPC3o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY7P286MB6260.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:327::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Fri, 17 Jul
 2026 18:06:45 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.008; Fri, 17 Jul 2026
 18:06:45 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	Serge Semin <fancer.lancer@gmail.com>,
	Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
Cc: Devendra K Verma <devendra.verma@amd.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/9] dmaengine: dw-edma: Serialize abort state updates
Date: Sat, 18 Jul 2026 03:06:33 +0900
Message-ID: <20260717180639.2643243-4-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260717180639.2643243-1-den@valinux.co.jp>
References: <20260717180639.2643243-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWPR01CA0009.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::14) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY7P286MB6260:EE_
X-MS-Office365-Filtering-Correlation-Id: 3215163b-9646-491f-6f0d-08dee42e2994
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|10070799003|366016|376014|10067099003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	RSMMHCZwz/FZM3HEoXFA4ED7P0MjY7rTu7nPwl+Cb4H8fri4c2l7zHtioIBkPOq8miPWLzv759uEUaw3ASdclcXNZ2TqLslJJ+kEGD1QB3TwkSFXrJtF5eFLppZtundFLNRwoxUI96wnUeqoTeeFcNd7KB+P/5eOpZGn3NMMIOM79Mz+g1fPBKlMmfA/9T3gZvw0NWkc61/NV0HI5kyTR7x3gLUP+LXcjEbNyO7/qe5dsqgnUjAgpyPfJC/wOBfcuVgJCock/ipwonaXtOMpNbaXOOhvDARhhCvrFP19ri/BAcbNCYqubj4JJhOKX6bH0AjJmJ/pt8d7wfOkzy+jqCgAV/efx6TdZ2AEDLcaNvcIqz6ky5/LdoLUV3+ktugoApGtDVNCKd19iR/Dvb68eQKO90YO7XmoOjdeuMTS25jzRGx/s4wVrWLXog37eazcjxWFFX8WAb8Mx0fclj5ojP2g4C2NWNhdUQrtoING7fDGzYHQSTUauqIgerWLytNBIrOt+SmuqA0ZgBWSLG4TbAb1sw3yW6HUirlq614NYBJa8dekf2JdCXnqrJcGa0mNEw2scjYgFimPAfuAx0YGPaR3p7g6q6VIxmxOSY/NECa4jrDahHiIgnMLhafl7IbdAlnvubbz0AiB6C/wUVLTGS9GF5RMyu8ek0zgdyLF61w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(10070799003)(366016)(376014)(10067099003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?f2ljaarUgvUQ9suWy1cLvck6Jj1fBYmWFSWDWjyBLdWR/OvkuuSF20eKtRL5?=
 =?us-ascii?Q?UJzgMXzn7N6QGmDV3mV/wTj9z/j8DHpPvnEzhAsI6nnpGWUAVCQt8OeTCwzZ?=
 =?us-ascii?Q?dhNpM/SawzKGUlEcP5rMeLP0xbfsSVzxnRxJxJU0pV0kimahPGg2oqy9bvPL?=
 =?us-ascii?Q?JN5AKZ/kLjTQY6xDtOOjcGySuMyXQ2WrJODFA2UJ/RTnpRFRR5ZGmMKgBE5K?=
 =?us-ascii?Q?Xk+eNFIYktwJXHA5sy4CQJfuk8Y/bPQlKm76ybE6IkWaPQgyMK1DeO7OF7jJ?=
 =?us-ascii?Q?Z2IUASFgXXBzSjt1NXC5+OzZbp3ZIxkz/H87boUH42OmWWE/WKYQNS0DPalk?=
 =?us-ascii?Q?Mpot/rQzzhNlJ4s4sVqnvQNT3MKIRmz3ULoK5yDdmrLgjOAxJlk7QwMcWOwB?=
 =?us-ascii?Q?e0ZUsTxguBzrWMPr/bnEbo3pg5S1zhytWblFUxEAYfZu69iB/QM6qj1wQk2c?=
 =?us-ascii?Q?jeuMKEyMRgYRktRFNGl5bgb+j7wnMG8W+ordwMAJxrmTHFD+TtI3ssCnnJua?=
 =?us-ascii?Q?s/zlw9AxLp/zLuyqIaMARNKWUTGYVEBu/mnQ+qTsf8dvCgCK0S3nTwl7+zBj?=
 =?us-ascii?Q?MdTPbw25+Acaz87cpFRt1KaFBpV14iPTCU+I66rm9TeWoarjSRkVHtsYFSuz?=
 =?us-ascii?Q?lz41OK0Sj+IsdwfXAtNLXfiT4UwZB9Up+62DZ2G4HORi6naelW1AhQmCycry?=
 =?us-ascii?Q?7+lxbXv4HKCUSlnTXSOvYEAVYPbqBPmohc2KzdhPFdcpigBK0K3grrJn8QsC?=
 =?us-ascii?Q?F1ZGhMwFBxJDtkLZXn3lb7zg+gQgpqEDhuuqjHfr+7j6ZcdSdP9O8gqiP/Tg?=
 =?us-ascii?Q?+chNbTa2ObVkU4erxCYRz0RH+BR6oCGXVNZrj62vtYauEm68GGmZjQrSEH7Q?=
 =?us-ascii?Q?ewGV0qKVomQn/sKoxN0wzPQnrgectkyDzI4tavcr+9CMFaAATRyPTtsFgo0U?=
 =?us-ascii?Q?FOGOy/G4CZLh7I1/kO3DvqU0SJpgirS9okBgXEuRPeE1yWByFeqPZTBD6fu6?=
 =?us-ascii?Q?kq479Xt1VRpzBHFLeJXxUY0Kju38LY4U6PwnTfaWQggOKVUl4l5pGsS0pLSq?=
 =?us-ascii?Q?gqgA20YHcBWtbDMwqwWF+c3ecdkke/mpygMIBoZxEJrmWNc2xO8712v7v/FL?=
 =?us-ascii?Q?Ir5z0Q21GcBlYWzoyWD7GzvT7t/aSLDcEez7li6fLaBdrOm/+l4oJCvX8nfq?=
 =?us-ascii?Q?3wOjGpLCN2ElssgYmCIA40neFoPO6fjA+kU/GFI3mADOEndy41rGPrH6Vyeu?=
 =?us-ascii?Q?TfPcjqnbgSVj59hR5y0QFtwFSpRB6Nergj6VSN0hYs356vUW/DFa2pG2fmJj?=
 =?us-ascii?Q?UIRP99AJQWlxtk/Cu8hiLpIvXQmWXzVwSCvGZQ5pLq7HyIpXaIy7SM0uD9ga?=
 =?us-ascii?Q?Q1y3/P+qvh1nS2Dstgsp695ZmEs8sKjJAjmC3FzPfKnGl7j80UMy0a8viIHK?=
 =?us-ascii?Q?nyS9JP43k997HIEu70NINIXn51EsMA2VvNB6EWPrBjvTwBlS4k9zbPsyERqY?=
 =?us-ascii?Q?J10s2U/zslWxhuT6LolzCdPUEqbJYSPk5HzaD7J9CW8MkmFEF1iAzanywf3s?=
 =?us-ascii?Q?hotLYcM1OuDqJyAgjGcsmMQmcYaiznKjzjmj2dTlMu8Z4V3mcjs6tXVps5fC?=
 =?us-ascii?Q?WXjrmbjoMbEcoAVzEBDtBSOsbcq4qLe+GKm7pW3rEHq+x5CMOiShrsRFbcrT?=
 =?us-ascii?Q?Af6EsgpiebMA3WA6Xh6wMEU5jEzwj6djnI3LaQQnHf+Nd5VMoZ9GhLbEHHcb?=
 =?us-ascii?Q?/ZMClD4qphjFHnQwlAeMl9LO6/zGaCenBgOjm2B8FqZrq2ZL5uhj?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 3215163b-9646-491f-6f0d-08dee42e2994
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 18:06:45.0892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TnAcBIAieiIKc2DRAFnqb0v3NA/uxOQVKWLY0+gWn6CumdI9X+fQQSR1lZZLRKm28URiiOY2vFlTELENkzdcHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7P286MB6260

dw_edma_abort_interrupt() drops vc.lock before changing request and
status. issue_pending() can acquire the lock in that small window,
observe the old busy state, and skip starting queued descriptors. Then
the abort handler overwrites the channel status as idle, leaving the new
descriptors stranded for good.

Keep descriptor completion and the state transition in the same critical
section.

Fixes: e63d79d1ffcd ("dmaengine: Add Synopsys eDMA IP core driver")
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v5:
  - No changes.

 drivers/dma/dw-edma/dw-edma-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 8b094857f821..c0d9f7e373f3 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -650,9 +650,9 @@ static void dw_edma_abort_interrupt(struct dw_edma_chan *chan)
 		list_del(&vd->node);
 		vchan_cookie_complete(vd);
 	}
-	spin_unlock_irqrestore(&chan->vc.lock, flags);
 	chan->request = EDMA_REQ_NONE;
 	chan->status = EDMA_ST_IDLE;
+	spin_unlock_irqrestore(&chan->vc.lock, flags);
 }
 
 static void dw_edma_emul_irq_ack(struct irq_data *d)
-- 
2.51.0

