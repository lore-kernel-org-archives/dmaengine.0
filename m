Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021134.outbound.protection.outlook.com [40.107.74.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2046341F7D4;
	Thu, 16 Jul 2026 15:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784215525; cv=fail; b=lTDNLQ3p7KkduyKFRl81CA3m2KSTUUROGni+49gBn9hEVsKABFzIQoO+IU/eNwnw+9kFeFCkMfHTpH2kGDUO1fI3vpePjg7QTqdiTRjNdXEaQLUPoIggEFxbYAqE4DbzTNJyHRnLVwbfRRpvgqvVFWpBAb+WIB2Lhe14D1TiN7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784215525; c=relaxed/simple;
	bh=GOiknI4MxgoADqwsCrXhrQImm7QdXq5tq4DW/gBwPLw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t5nl6flu3aNgtQFiJdKlRReeSJ06JLkjb7mvedSq6ZHHARaUdQBVLClO/XtTWZiWXZsaIuMympnJL92OJlFdqlqEre3d7SlD/k4XNAXDP8fYljprUkT+D/T1LWiaT9/HkOaiaRUoE1W6Tb2nKeyzlqcf0s4i1a+rhawAXa5dfxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=nJhSmEen; arc=fail smtp.client-ip=40.107.74.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="nJhSmEen"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Usa7sk8ePvMHEpHjHQK+oPXJd60TQFeMKOggEztiAN3lY3nZSPfkKHKEAA1YoR7uETJtq7J43YDWifG6iwlKSsNzX71AhA8BuH/kfpx11aiIsv8eiRYurPU1wOwB4b2oMQr2NxnhnJ05yUxP2NkjebX26b8xiLGYUkLLX8Qt5te0ejX5koEhLan/fKZUqLyd62QaAdhdyeTvLrJSs124OcckqO1WruYGu1leNPKUuJvI52VxU3mOxwlcPqd6/5g+tpeTddwcq9nJkTgMxl8j8nLbE9cPgs1grnpvNbB+/i9CC7qT8NzAY8kqY4zup2xt41bJOhb5npWL0A3yx5aAhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F/mZZUgUbMYW5NvUpZd7ZxD1GRGGh5HfMb96+JayI+Q=;
 b=QEx/gBN6Oon1UoBzmaAPQR+pslAm38aepwFN5ylIrXAHHezg2Iv9bfvIAKWpECW6eJNt0nFSAad7M4w/44hBj4TSBBGlHQLmdhI4DXx8wIAxICmSPLf6RGAM48cRWMlgaEsMmNyQ7fuUzugJ2P8DNgjl8uD3cUS6n9KOoDIjOPXio1lmG6LATGAKEsXta2yAG2U24pIpgc7Z/q/DcJnt3UqJ7qQZzowpX9D/LqbwLhNJjUOzKGkb/4kDxsLQ+WGQhYmEbwOSJ0E6Q2wEDTCC33Q6uWYPLPoCq4PZY87qwuXM+J9IlkPLScdpS/sFTduhY9M7FK48IaRBKTInuwzMiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F/mZZUgUbMYW5NvUpZd7ZxD1GRGGh5HfMb96+JayI+Q=;
 b=nJhSmEendNMck6TNTruhNT3F9KJ6f4dbAvY4WkoOW4CmFiSxx90V5QWoAWYxeL0CeA9r+Tvf4SqpW5UqjL3NVUTEfx5/VjauW+cFn3y9STtMhBkzP1fq5lV9wIKahUQqsAZPKHD457AzHGIQJSgL/8hGK4YNuOWUgARkwr9GUrk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYCP286MB3635.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3a8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 15:25:16 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 15:25:16 +0000
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
Subject: [PATCH v4 3/9] dmaengine: dw-edma: Serialize abort state updates
Date: Fri, 17 Jul 2026 00:24:57 +0900
Message-ID: <20260716152503.1747922-4-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260716152503.1747922-1-den@valinux.co.jp>
References: <20260716152503.1747922-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6PR01CA0015.jpnprd01.prod.outlook.com
 (2603:1096:405:3bb::11) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYCP286MB3635:EE_
X-MS-Office365-Filtering-Correlation-Id: 262eab22-1d6b-40dc-bef8-08dee34e7016
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|376014|366016|1800799024|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	7uUIa59NNMHr+maksG/v8LZ1qI5OjVAkLpYEQxgHIzGbZiGG+HhnHAK8Loj9FlpF+fV9yF0h4HrLHWEP6gNUwIxVTW6z7A2f6gqSusiw4ShqjXRH2fbN4Kg3QMeJPrBJ5sUoMgYkqlLHrcgXDbR8IuHdssuvrMUpZXqMiHdOwxGUPmsowoi6vEH1NWL1O/uzduXbCRehUHXwTms117Lo00z93TMd8oIFV6BOrQy0FORwaa3qeJfN/NZBdDvpCRkakAJObgg7YizVD7P92TllFXAUKGqc02vMRgjddnQex24DXuBX66vBqvE14P2KbTBPaO730SRC529JWduVrcUFT1TbkfOsuIuWQti4+Fj4bCW+nYuJpo2nyU3kuQhsq+gAfuh5tQuIuCS3da4F4UpdF+llk77jnpgY0+l/diq04jlNb+C/fJVyjRPAp06tdZww0PRUqgXr0N4P9Os8NGkIER4H3xQi5K7CElZN6BrvbyQlwVIA/1Fg6nV7lkSIvEv++bcYmn9XbIMyeQd0HdlKAd79QViyWdJ0tiCYboq0WaUJX+134OcFFEzxaiDRGI0H8jY3oApA6/cFxYhnBo7Qv7P8MFJxNAcyskGIpYBq7nyUgspZ2s7GT4I0AJKSkJzD6+aOp5AdW+lvncz/BaGqa4V4i5qDOTaVqd7LzVbw7sk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(376014)(366016)(1800799024)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?illiVNqltWKSTGU19O1LkqgsSeVg7NaHQiRk/hrgUPrikwsopggsbxqy1qlK?=
 =?us-ascii?Q?+KFG3PzT3bQa+AOFyD22tweIVPfCPNNQZsD6wbiLobk8DkuO25Pmi2sQn3tT?=
 =?us-ascii?Q?9EzC5/esNgTQ9GdX2LurIVfp0Z2b09uQEy9Q46U+F14VKj/coZx0kVNJbVZo?=
 =?us-ascii?Q?82OVEMQONPcuy26GAs+CqVlXrQ8798MITqP6UAvFMR3UvSkLzTr2C3ZKAeMs?=
 =?us-ascii?Q?4CuDNSYfOuF2lNnFD9mg8XlBTm+vgySe0PDXheBrvsXvXKzEvDNA0egcAGng?=
 =?us-ascii?Q?y3V28dYLZH9TjlsN2ePv7MSc+ydW1PaNW8gd82HVkjYPZ21c2M+UzsXtNGlV?=
 =?us-ascii?Q?ySb55SQsMDhm0VEY5KeVxg1mJ+YilIMKpkGpKjBLGFZPuUNTg9+xUOo8g3QG?=
 =?us-ascii?Q?4li9knq4vabBUsb7ARiA9tzNv46fkHEIUTnhrdCB55eAALLGpC7L5/KTQPA3?=
 =?us-ascii?Q?P5yXLHqyrU3EarlpwNbin8uP1u9aCclvLO16o2U+3xIIfxIF5lBTrL+OXwwj?=
 =?us-ascii?Q?eZXR84ydGK3YMs9zWuVwjQA/w/JqWhIVVClWsNB2hXuqdNclu3ioWXibtMRn?=
 =?us-ascii?Q?ewdDX0Voa7pkoJwACafPoMcojelPNBPNmmqNTHNFYeULog8NHPdZYNkRlo59?=
 =?us-ascii?Q?xpwk3xk7uAkeW/3PQiLd2fyDUoTXdSo35LayXdZmbdDoVWGQz+Ts4mpoecsW?=
 =?us-ascii?Q?Xp5mwsVHph76XHTA2Kk3dmY2kn0X999iL738VCa0UQ6Gw6MvJrUlikLB+Swh?=
 =?us-ascii?Q?j1ojoJdOyRspEtetNJhOPDU+UjALaL/WV+x0wCcqMd3najlOLiweATEWbdJZ?=
 =?us-ascii?Q?fssnwopM5IXQinTCwwuvrlJc3VgeTeBE35fLylRxqs+3aIR0+ZRUmUUzvp1E?=
 =?us-ascii?Q?WF0tVgOZj/cyw/6U6Hh7zVDiqBtwwU6lvh2sHoAOCV3WOGDU/q/GDnVEsBS2?=
 =?us-ascii?Q?RE6YSMZdLSR8WINX6Aa5/ewpvQ9URtaOhZ7D/pUP9KR5iGuQFP+ZxYAB9RRn?=
 =?us-ascii?Q?JCnC+HnhS/NJOC04j0xozj1CCnYibv2BPNoSEWihBfgwbrq/CrMObvmgmRcs?=
 =?us-ascii?Q?URPl0MT+m0MXPCC35rHvGi3l6mBGCMZPJHlN0KnF5f2wztekOc5i+BwzXYCK?=
 =?us-ascii?Q?C0jO/f16kgby2Nt2NscetLY6RBjirFC0pTfxFecHHaIJbedfL5Bwn7xsGuBt?=
 =?us-ascii?Q?RKKnLhpOqTz5WRxd1bOUI8p9o9RF26OiOY6wc4oEp/ARK/1a/1zCBAn+pFZe?=
 =?us-ascii?Q?ZO8e5rS+/stl2t+VMIsGM6o0JRXT1SHtpYUTJOQXklh36WcaDIjsVQeduRLL?=
 =?us-ascii?Q?fDaB5na9N1NYN8F0SvGtCYuXejEQkgLL3fbos/lMtc7TyZSuPYq9vIUqiImh?=
 =?us-ascii?Q?bCWo2nSjJPGusUXFvi4YujfK525BKJAHEYbG3n2J6h0M951XfteD3J2/8aTa?=
 =?us-ascii?Q?6c9AFUY8vVGDhjGH4UYjd2/Hg9gevTf5wne4s9kuUbOszHNSNO1on8b6YSnm?=
 =?us-ascii?Q?+OMYV8jpE+EUGYGQsBlVMchOKITR4rto45V+K5bOjnZkwr1YiBctwrB9rIV/?=
 =?us-ascii?Q?p2M8ztf1JMinFwx4gI5h2pDfZWkFZakZ8nMjEru1cghooGdf3uRj1C23hdZp?=
 =?us-ascii?Q?IGhjsMO7Q80GGS5c5IxrEp9UHYCS06/dqXzjBB0BkzgPjhiEAUpdYT4mrcXH?=
 =?us-ascii?Q?+SmYeSqD6YdctXb3ADVx98s5G5oeoldJqMWUd2BXFCjfhBU9zOQsG1M3mEfC?=
 =?us-ascii?Q?LPyiTVEb0RbmxL86VcgJ0uvf8UqMK9HHfmdDnjeiVKrt+49RKT+9?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 262eab22-1d6b-40dc-bef8-08dee34e7016
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 15:25:16.1225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AtED4rtV9Acuq9wI/vo/AiVhvoaqNlTQ9yASjAwru85k4UKfwnqe9ju6sXxPxc1OobxT+yNPoVhzB3mkgSw68Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB3635

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
Changes in v4:
  - Collect Frank's Reviewed-by tag; no code changes.

 drivers/dma/dw-edma/dw-edma-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 972c7ea18d46..daf70df59e07 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -736,9 +736,9 @@ static void dw_edma_abort_interrupt(struct dw_edma_chan *chan)
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

