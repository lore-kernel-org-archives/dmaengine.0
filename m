Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021110.outbound.protection.outlook.com [52.101.125.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34776408630;
	Tue, 21 Jul 2026 06:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784615308; cv=fail; b=jULT941rGTrfDJU8BC+pcpJvjsDl7USsKQ9eBTNTQ9/QBJ3XmuCg7CkhOvobOfvgtaswv6Kq+GDX5QgaebpDho7N3BXRKkPaX/hL7NfKeCWU/KKNAz3vaDZIFEy95Fbq6yoEXK2v7cgKkOhXrzz7oSbIX7YSqnD/lWN368F9eYE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784615308; c=relaxed/simple;
	bh=n/oIN5c6aQbbjggZvXcdRTWJwvNXRJuoZ5j4Qhu+NSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CC9yDE6rxl06nV++PNZh/4eTFKfuwImzjlUQNN1q3aVU6Lhdo/kC4lZKEqR6ZmqAd7uSYdkz407jwvwPZNIlihU4b9r+sFaqHKl1Mjo0BawefyKrFMrJ+5iI30PZ0Gmm9MIXDBWVKjV0lSyyNfMKA8qzvRKGJJzDCQmlUgaNrcI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=Gc1HtaCh; arc=fail smtp.client-ip=52.101.125.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="Gc1HtaCh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=du6eCgBW/lL8A9WBwozD2w9S1T5rQDhpKqhjLbdVmLMhxy3lcrZRbXaPna/+axE3PZHXmpwIIdghHY9DUizveZWCTepRc9dEI/ehPzEyqnBPaUSpdSO6ta1qxFvSub55aG+VF5RN0iHmuyR7Wg7DoURNYHTUVSz1EjWpCz9JLpQcwU7jIc9tKMyMoqOoi6YXnlB9Hbx4IDq6hhw9lzAetWvgU3a/t8nCJsac8crmHmPGqwMOvXFKe0gd+bYXn4AfU5EsZRvBSpGx05yghg+R57n81ZlL3SjN7ZA+yycC8S9N1QE4k7YGxlK7W9IU84oVusFZlmM/Liax0NAI63LHAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BbPOr6yUANKSyOxOypyBZiTzvYcR4aoIBIBGDUTibsw=;
 b=fI4zL7jTZ0a1pEktWRvlA1gxVJam/2m/I+LZL5WfrxAkT0sy4CNlu4ovvYLodCc+4A2E6KiBP4aPBatTyzvHy7NarF/XZlJgb3j9N3QjlFYf/Q75Izcv9tvbmoH4n9rTxmWJgrnKKUbo15TZOYlrp0Szq+6Tv1uJmnCoyu10Hfgx1lq6TeMYGBUA3ZxwdALiG1zTS59cCNoVWypmRMLkIaylvzW84g+OGV4uKddCDLx1yEV0ChYRQ+Bb1+8EejN2IUsck1WTMNqnFw21B0LhDwM1+Dt8s91AwLzkRxs1FVDXAKNJcnYQpA/+mwBs9KaEhuoMJm1StP6tJQCv2d/1qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BbPOr6yUANKSyOxOypyBZiTzvYcR4aoIBIBGDUTibsw=;
 b=Gc1HtaChsoTU6+PcIHrKK/y6B6l0ow8LBOvOmy+mnZyPBgA3KuPNViTZUlbiNoKZ4T7yWz3lp53GIPEiT7sdSQrgiKdzPQPy7bDWPF/3JGwqUsusi7yWeMRvLIC3hhg5c1RJ3UhryDB3/i7Jqjz3yghUd2Aap3Wk8RTPA0yPMkI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS7P286MB6796.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:432::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 06:28:21 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 06:28:21 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 04/14] dmaengine: dw-edma: Initialize IRQ data before requesting IRQs
Date: Tue, 21 Jul 2026 15:28:05 +0900
Message-ID: <20260721062815.4117887-5-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260721062815.4117887-1-den@valinux.co.jp>
References: <20260721062815.4117887-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0095.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::6) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS7P286MB6796:EE_
X-MS-Office365-Filtering-Correlation-Id: f9a1a8ad-689c-4a00-d45a-08dee6f14267
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|366016|376014|1800799024|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	buNlR/QrGWb9c7q/V/xytpUnTS5u6Q7xSM09fgc+Jw8oriTFaZIfqHIuilDmpvvkd7p9ZIOgVJyHSZvH0Ub3shP7zetadFF2CphG5CaWxZsRsrXcxqsqrpd8ygzlxGzDjQ2W8dHSkRF2odkGdMUGZsdBJ10tzjrc9Xaoo8K5kL6cA9EMYKuZzy3zuffLSmYrmipHx4UMQJNkKinUqzUHRevDsLc5qIweKToOu0+FEeFqo+R49Eqd4SggPamFS1F6uNkz71J9sXvjSlsKQjgQGrei7nYj/KxkcYtVmLG4jV/tLgnTrDa92Xu7arPBAWF+ZvwszdU3tcLBxoqfMfSDAmBGlHpRwv8eR9hU8I3D+2BaIaazzucXxS6QnKRNszDcemXwPb/1gwFhyLRDZBGtqYA2yGOAtKPOkiBFTq14jCrd2Z4VUvB+xmznZPBysAxlzGYbf0AG6UZYUQsp928dIgfJj3WrUgEtCNI7tQeDZVVm/k9qZJRLl1pK/VUNjNagRah/Qi+5UPbgjcAfv1Goo3MqgzI5fjxFua7AGyRTzuR5krH4IU0wdvb6V2MMuXPfbs4GB+N4LBwXNDx1u1+mrBSnFuu7oh0g31cAmWd4JC9/uDE9fRvTwFjtiKjQovs5uPawKGdsk06ax/8zQag151fG4qgmsG9H2ONilJNHQW4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(376014)(1800799024)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qB6v70ufq0VhMQefPidCgGG9Lv/hAwKzy2iGHu3X5pNRl0uZghAWahdZtPdr?=
 =?us-ascii?Q?NZZqGy3I+SP3EOqiWlxx8OF2Gg8Mrt0x4TDsZWH9yeqBKFFMvpjD+3pGLPph?=
 =?us-ascii?Q?jJDhMybunU5JdCSRmjCr/P2933Mt6yph8zrk6JCuZ08oZV6/EwjM9bZIkUy1?=
 =?us-ascii?Q?4T7s2c+/hGz6FKEGJmzZjAF3af0quDOtgwQRxHkCHCxgWXsPInu6u0+qO8hv?=
 =?us-ascii?Q?4W5JGc3+3eGGS2WKcAWv+DYbRxJ6/WYp42lhWy6tLaE3mNrVxOkMdiKk+2Tp?=
 =?us-ascii?Q?CG8Yjoxa4KgUDPzW7OZdtVbhfKgz3K/fBYGkBZaKYUsW2+77ozwoT9MFKqVY?=
 =?us-ascii?Q?bPgNwa0qdVv3QOmu3eEK8sIceA81TWj3V6ztamF8ARRmmyh8ZX6rHk7mwppp?=
 =?us-ascii?Q?Ofjkh9oyE4zjWN/hWLPFwrjqQ8BRVwjTcydkEKalSYdubhEvpgY6RUdak8Z2?=
 =?us-ascii?Q?zjxKMQefm83qhZ+eYmN1MGB4wOPEU9tr3Qqquxirz6Hv+jGidG48U64ukhFt?=
 =?us-ascii?Q?TPtDn6ADld8R/Oc0Ig6g4VcO26CXPC4LMWZyKPnulmAtRCx4TIraCzBmGSKj?=
 =?us-ascii?Q?Aj58J5baYgLGE9/MZCZqIk+M3JgCK0TKwM8vwVNsGbQnfZu7pJmyV+hi9z7J?=
 =?us-ascii?Q?TlAn6Y+bNeS4Xz9WCciZlz0rhJGg7r5BXFdwq8e/eCVxfTLCVTYaYkz0fJE7?=
 =?us-ascii?Q?b3NlaVjnUJ255GK3BrASHSjSJ56+xMNB/wbm3ySNseRT/CzRTRr3k1xX6Mm6?=
 =?us-ascii?Q?QnCYuaDJd4Juu7n7lK5NCy91Rh8jjFDaZne3MUXw0oy/HmYkC4W3Pt3sV7tK?=
 =?us-ascii?Q?S8wOR5iE5ryCyBmVjYYfGCdftPx+ObBiYoTCde3Z+1n0L3PabIIVO/+CUI1Q?=
 =?us-ascii?Q?q+ouZD7j+hkO4V2TuT+2Kcgw2nPO07WL/tW7tBIi8iUM48ZnThqMpy52cGI+?=
 =?us-ascii?Q?3+ikaoeDUWuqmttqtvcyEvIOS6vapD1TtiYMVymkxd38tMFZlICxZRPm8GmU?=
 =?us-ascii?Q?cDbzsgdeIlR1o0TGv37Bthze+a7cBNMbsxlDjpEtTcPWOuv+Aag/TgajEysK?=
 =?us-ascii?Q?OsU+iu8zJYX4bJMHf61TgJ03Y1g78RTnk7GcF2w0FZBui8G66gPzA+BaiLky?=
 =?us-ascii?Q?zlZVuYVrpxAFgS+g6rbSRQnT2MzqsZu6onW0a7TnwPIjyb+5ZP937oJS7Qvi?=
 =?us-ascii?Q?9omWbfkI5bZlivrJqtutcWdI10QDmXDTRX5Ng2LHDAXurSYqCwH47k0l4tMu?=
 =?us-ascii?Q?+OY1rbCesE7UYHr7ZukOKRaGKFDteNvI4y2mkozZbbTJoRIZHxRirRj8EC80?=
 =?us-ascii?Q?EAFZVN801aUV+9eLZJJmxnt82qe/2IPwWso2FKR0KgSMoQzadX8QZUqVt91y?=
 =?us-ascii?Q?B03/GptbNVGlSChSCmYLMqGpE5oO8VyvsnxT+Rz/rDtAXHMNS55ReSU6bcW6?=
 =?us-ascii?Q?n8ppSNAu3mvdX2S4J0ElM24vHrpXv38QNNj/69lJKz0CpOVjr6U5Oy/rfWH/?=
 =?us-ascii?Q?kuVJnzxZbXkd2XCeHWTU1nnkhVvkZ7I4yOVmfrVIVi8gYoRsatuuHkTT6G9d?=
 =?us-ascii?Q?/7wEI9bvf3PH6mpC86FvNlDPokIREugdMBzf6obFcBoGAf8AiS5rmY+u0/Bf?=
 =?us-ascii?Q?tBvjlAtp1ruRrbnw4h+TgZUVexeoS6jcXEoY4nFGKrww5okogk0zVZ7F/EMa?=
 =?us-ascii?Q?VGXR3kBorLtuHh7z1dZznRWFkE0+miwvC0vWSPRnx5Z9o/GZwchQFcaCcvRd?=
 =?us-ascii?Q?VPxOn9nYuJDgKcYzivlhx3g2ZkG+tJMDyoJ+aXCQXTtz7nWED0+2?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: f9a1a8ad-689c-4a00-d45a-08dee6f14267
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 06:28:20.9579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BZ+wBE+OM2aweIZgANq5PaG7ItgLkRI7bBzdRtmmHVSvUz2VMZ3yFrWdQjoJczngOMmXbiwDcs+Lm7b3I8AOQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB6796

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
Changes in v6:
  - No changes.

 drivers/dma/dw-edma/dw-edma-core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 3a8610862cff..ee9a8c32adf4 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -969,7 +969,6 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
 		else
 			bitmap_set(irq->rd_mask, chan->id, 1);
 
-		irq->dw = dw;
 		memcpy(&chan->msi, &irq->msi, sizeof(chan->msi));
 
 		dev_vdbg(dev, "MSI:\t\tChannel %s[%u] addr=0x%.8x%.8x, data=0x%.8x\n",
@@ -1051,6 +1050,7 @@ static int dw_edma_irq_request(struct dw_edma *dw,
 	if (chip->nr_irqs == 1) {
 		/* Common IRQ shared among all channels */
 		irq = chip->ops->irq_vector(dev, 0);
+		dw->irq[0].dw = dw;
 		err = request_irq(irq, dw_edma_interrupt_common,
 				  IRQF_SHARED, dw->name, &dw->irq[0]);
 		if (err) {
@@ -1073,6 +1073,7 @@ static int dw_edma_irq_request(struct dw_edma *dw,
 
 		for (i = 0; i < (*wr_alloc + *rd_alloc); i++) {
 			irq = chip->ops->irq_vector(dev, i);
+			dw->irq[i].dw = dw;
 			err = request_irq(irq,
 					  i < *wr_alloc ?
 						dw_edma_interrupt_write :
-- 
2.51.0

