Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020123.outbound.protection.outlook.com [52.101.229.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5874037416B;
	Fri, 17 Jul 2026 18:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784311618; cv=fail; b=J1XMhA/yVaqepdpKm3q0ssU4OKD8yQBtPxq6lQXQy5/I2AM75XuUokXQhDYVBLvgzokovA90JkbP/TQAyTHdGMrjk+YazPFgc9qF73+6L7ER+Y1E0WMch67CW6RJrZGOPg7PqpViM1nS7fXTL1ArW4spe2sY9UwbMcEVWPayakk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784311618; c=relaxed/simple;
	bh=pnDZygAeWvl4/AzzaU605kKofEidVYlDqj8MU0N8HTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TQe/nDTxE8UYtdEhzRRu2tmHa26M9BrYScP+2UiPOitm1FFRByZZlbBs7N1adsIveC71GahmizAiMPJ+ML5+WwFfdRh1EsbXgE5HIfChYkUhGYwgxhlOqfGXgeT2D4L4ebM0m2fCS0szG1tLgzRgBUbPJn8Z0MJakmMIqprI9bM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=NF4nkjhq; arc=fail smtp.client-ip=52.101.229.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="NF4nkjhq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=stFLzNuClb1M2WyaVt75uT1qQ2W+mulCCej14cOBpCZ21Lz6UFI8US7f3TWkJrh0+maFubmzBBQNH9eyTyBnSSFKKn77uoVdZasbNnlkSNtEi1KZ5DxdRmRqJWWnoPhBmXTGs8tdkoIQTrZxDwdoAK2hfVW7JdmGk+EZA5zn8NRlpwqGUC7BeKL4WJ+hQg+jydJqiD8pxYHx+sEH+pc8BAEI4X3qbVoy9CDgFfmH+Jhw7bMIl43YS2Hb0yomP8F2aOd04wT3vRLugiwAgXFldTcefk6QlOyxqDpTLKRMaS5GuQT3/VTu3AGKc/cHiyeHxHLGAZ6Z9Fgi3eOiBa3oRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mol+LAijGDfQDrVtAAtzAXmK9BaN3QdgiWSywAYLGqA=;
 b=WFFg+rZN/+Sbycg/pvTaEI7YdxBM6CyQYYTZ35BjvQ4xdRsLR5IK9DqkywsV8/YsytDm9FSiEgxeyhQqd65+dQRl5fFjSsRuubaDhhN6zTn8H2hfAFvlYuJ5B2ea1TgZd7Ni6ow35SRq9/pHl8jZA5VOGyN9TL0AvxsuCsGzN00boaE8mowbuUF3kXPpM0ZNf1gU3l43gWAZb7wCoXXf63hGTV8n6fBRSfRAB+jqIlIrlS7KzpEx7nvIMgLsysYAl0g1cUNiedxSd/I8qaTRG+MHWi6MA81UqzSgA3AHouUj7/V6HbPTrV+2civLGVmCN3IiR/9i0hLRJ3PI34BQqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mol+LAijGDfQDrVtAAtzAXmK9BaN3QdgiWSywAYLGqA=;
 b=NF4nkjhqa4+wjOiUjqW1epfBKxYnDGkNH9+rPh44KlMfnttaymzOuEIa0bdQcMC0C8xRxkB/Yq+0TdzeGRUIGBxLy0S+1IyNSNZI3J1Z4L004lbt8C2zYNEXG9u933BM6DxjBx10J83ySIYC3EY5JNzWe1i/L6BTgpI5GXOu60w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY7P286MB6260.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:327::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Fri, 17 Jul
 2026 18:06:47 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.008; Fri, 17 Jul 2026
 18:06:47 +0000
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
Subject: [PATCH v5 6/9] dmaengine: dw-edma: Clear stale requests on termination
Date: Sat, 18 Jul 2026 03:06:36 +0900
Message-ID: <20260717180639.2643243-7-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260717180639.2643243-1-den@valinux.co.jp>
References: <20260717180639.2643243-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0130.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::12) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY7P286MB6260:EE_
X-MS-Office365-Filtering-Correlation-Id: cce6b669-2e13-4e73-6d2a-08dee42e2ae2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|10070799003|366016|376014|10067099003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	0aNsP3foUS/DSKoXDcC11Ka9eVQ4KVpboHSMmgeM18mYIAa4pddjpRIGF0nXgjItyHIxRe+yU6TTtu5lyIvXC9l2iUdWlxAAfLhSw0nqjxqIDXoeNsDy9YjFx+vnn5v5LbfPtrqp1yIDvdY/tC3BfnTFG5P759eC4JqNkfpgwvBqCSaVUekz3ma3ERhFf998AnK3T1bd6VQMF1JsU5B40QmDte45WEHuj+xTlAXWc/iJiLRRKKF573Q3VVsOh9VqvkY970rfdoxNBffNvKRbAxMz0iGyrks67OcoepPk05OaKpgkCNr5NeHz7XuF53vqbGqNriZRH+/3h5LbFVOi922MCOkdQ7C9MuTQ5Uat17Gqm+PFPrC9tvGzljpnaYxl89IGiwdmPcxNvZobIgshAAPXuejJ9a5ctBzqEjS9zRtFDBgx+hr2zc0phY+dDhVq7dz+aUASAB7SFZ0Ssljw43frXJtC0znU8EglOzTKLib9LsYhyQCXVl4pKG6cMxuLuJXNcCSHrbu8KNzoBi2vJZ8Bd+Zy5YJARO6Gn/01Sk0qsCJb+7AgPpERF1ig02FO8qRR4Y+xb8gmSNXAGGi+Yr1Uy/wEI4ZpF1pyWVHCAkvP+zKDhCHfhHYYQJQuVfsC/OyySz0Zn6xxW4lrYxCtWwajcUq3fFoe25Ry6trPc1k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(10070799003)(366016)(376014)(10067099003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?c8g5ev0FHwn4BaRoMZvIDtJ4Jusy/zd6oxap8sVwK4knITE/7J4Gi3kEEMXF?=
 =?us-ascii?Q?Oh/nlaVKAqrW/p/mXgFBhz8BM2cZHdqg6Vl4XYsOuwffhr9T661QgTyScGtq?=
 =?us-ascii?Q?yleUfeqfcIhbyBtPW/+n2HFIXrM3ToqeOwj3aIkcco4X7sB601KwLlMMZU/3?=
 =?us-ascii?Q?f9J6wR5X1nk9RPvt0fJhnpmJxdPkryBsVE+zIVZ87PHL/pBA8mIMyt/p7b8s?=
 =?us-ascii?Q?iwBE6cU9Op1up1VZX2FYMvNFShvyMrHBULuMK8bdsBGH5CruVm3I9eDch0qZ?=
 =?us-ascii?Q?B2OxMc2KaqQSbOpHJkfSJ3cHl+B6MmeWe0fQZYL61oNy5e6mSb3eXtBwBORl?=
 =?us-ascii?Q?iXXzhkXsXcj0Fkdzr1QJ/rpLYYwjovbFqIxwBelZ7XH9ByigeE5ziDPVnJl+?=
 =?us-ascii?Q?kLhHF1gwNIqVLE5lN14h95rZaU9ZhHSP0GwQcm6hjVPe3VSgocGjhtqVf+Em?=
 =?us-ascii?Q?Tzjs0keK+g88UwNMnMC6NkOl5Gtcapxpt4ADjgWrq/gasP3y0S9+/2M8EOPB?=
 =?us-ascii?Q?L7oCtzfXFoTa/vsaYbzcwaxz9AzH/McotgFJV1YNerrgntT1e8siO3FWCv+T?=
 =?us-ascii?Q?oEeJWvczG319OD4hGuKX6RP+322PnVQ1gWEGLf4LG6q8CE9XEyMR2pakITQb?=
 =?us-ascii?Q?1iN0fQOZ3woOpq8AoHCWNggdteBM66e/DD7+xC9C6wL9dJpsA/MTuNqgsFhT?=
 =?us-ascii?Q?DMns32mxkT5DH3GDogZFVVDw75XDbQZ6wjzI8cGEylb+fOD6Fem/qRIoW6c7?=
 =?us-ascii?Q?Hg0tUVtd0LXzCBQ1fZQsA7NQ/OapxRsjeFVcbdqZX87/y12CAYS8iaZeEzGJ?=
 =?us-ascii?Q?j15oYt4sQQk5Qm7GyB56u6vYu3I3pFE8Cn9dVpdLOgA0tyaDYJEjuYBs27r3?=
 =?us-ascii?Q?6AjauyFDResuXtP3HuRD/tCe/MhR4QW+jsyYMTsSNsDu+xb+0/zBnwwlVBf6?=
 =?us-ascii?Q?uyL/vq1SzAVnLWPX88g3Kxbeie0LwNS44OcCBOVmD6XPvMqh0kbXFJUiOeUY?=
 =?us-ascii?Q?Tcp+EeAtdJCi7e4FfBPVSaKYT2ia/gSbs/ya6EsjD8GyfedL+qfha0FzqN5G?=
 =?us-ascii?Q?Av8+AFZAqys62dPYACQc0yP7yfUeXQ5X7pBKYVXnHcoLS8hhYjQ79qAoHNUR?=
 =?us-ascii?Q?Je8w5O3sXGLzxQmdbvfbU95ebkiWACWfdB6eMNgs1Q6eCMbywErHcVbnUowI?=
 =?us-ascii?Q?vn1ruQFPq98xDYmlCT3rXUm9A1/1mc1PnlHEVFBdbOZkv80cFjDC8C7GCG6E?=
 =?us-ascii?Q?mhFsun0gpwIAi/VD2ksUeW2kbqHygiqgK1mPuBy4DbbifqEgBPbbEyH/ZCUn?=
 =?us-ascii?Q?m9FBGg66QF+fFXtlOpANwpxy8hnnK/ByWiKbEDwDV8sdOeUZruuPLxWfTMtn?=
 =?us-ascii?Q?Ev+2Sa23Gp9iYMCP1gIRzjdvEgGxdsAkJD6EulINyrlQ2CQtM3c64Upq1MmM?=
 =?us-ascii?Q?wYiHILhKc1+FhGWCNnm2UMj9TYHXnGzSAkR/AnQZTFAQFt5JEDS01AqwqXvp?=
 =?us-ascii?Q?la03TjAHrznAwAn1K328A8neWlYytSvsKBepMPepgi9Dl+DmpPEcGzK7y7jH?=
 =?us-ascii?Q?z5KeyENFLAcEPzz9qRrYGI++3flqR2fAP6A66B1cApTVjX/8kckP2LkFR9U+?=
 =?us-ascii?Q?oIWHXBGjMzhAOf6XTuLKYmruUTzcPYc6k3z6NElE1kHjPmLSvR+WbbMyU3iL?=
 =?us-ascii?Q?prddgv6Ex1JRSSAc7zP+6Z/pRdVeLhrzwpi9iahAN6EZvzQnVLx4cAAs98Jj?=
 =?us-ascii?Q?yJHJGavkDVIF+qTc7xIV3WROb6SripwEunuq0kXHfWUdjSDh+yST?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: cce6b669-2e13-4e73-6d2a-08dee42e2ae2
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 18:06:47.2866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8GIn4c7LOAfqR2ROax7WJLECH4Ne5PinCiafTaFdGRayzb/h56l0R3CYk3qYIt6FIJx1KCy+n7yPYhYKG+VyLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7P286MB6260

terminate_all() can finish immediately when the channel is unconfigured,
paused, idle, or already stopped in hardware. A pending PAUSE request can
survive these paths and block issue_pending() even after termination.

Clear the request whenever termination leaves the channel idle. A running
channel keeps its STOP request until the interrupt handler consumes it.

Fixes: e63d79d1ffcd ("dmaengine: Add Synopsys eDMA IP core driver")
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v5:
  - No changes.

 drivers/dma/dw-edma/dw-edma-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index cd10f9c6d217..ab63d7bddaab 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -292,6 +292,8 @@ static int dw_edma_device_terminate_all(struct dma_chan *dchan)
 	} else {
 		chan->request = EDMA_REQ_STOP;
 	}
+	if (chan->status == EDMA_ST_IDLE)
+		chan->request = EDMA_REQ_NONE;
 
 	return err;
 }
-- 
2.51.0

