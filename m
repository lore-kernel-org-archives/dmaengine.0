Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021094.outbound.protection.outlook.com [40.107.74.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023314C0431;
	Wed, 29 Jul 2026 14:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785335451; cv=fail; b=Cx2v9SSs4+7/ozi1VZUz6TXlmesCXkjpm1RW/EZkce1hlponw5Ak0+ASJ1qUxRRlvGFw8fS6ZUf1vDiotqHChTAVWi0w8YLuzbreikOpNr96LNFPwKN9SxCw5Y90r5vZqf5RR3tVxxppNa4QGzfrIUGBr+pRceFw9ulbnvuR6Ws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785335451; c=relaxed/simple;
	bh=NEy21/HSedcetM+qMJheW9Kfl+Vdfg7grefw1ySWGXo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XZKzij+nZPr8+0tQLkifmHNDg8gAByMV+HT8UvPqw91ADbi4jaSki3SJX8lGQ8bOjx63vz3RtnxokBHg3U64/zKC4EHRTu+sHlmSmqOqV6kNroZKOfqeAIEyTQuCAq1TE20/BwwRWbBt9JNYqTIHUBtN+WqWrx5UOf1NenCIXCA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=pjZmmKEr; arc=fail smtp.client-ip=40.107.74.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="pjZmmKEr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lWFGscqs5YU4fGojQkmHDKw2Z19HIKilImNHPSxxN/fNhDGQqStun08tCpOryXCE8N349Thx2jgE7khub6VcZAvLalRhYw70YA2hBUaK3VbxSF8yY6+RhTrYr4GKWKQrtcEyFT6CqjS/VCKdXoWbJIJfff1AhrMqOLLQlsDScb2RMBpOrAhNl/01TpiqF17R73GN3UosLJ6j8n5QBGBFZ5U1fl49s6lL+zOR5HCsO0phJbbIGcN+jsYcWWY1Um2ACHYacS8pieOldwAFu0W5QBUpt620/2Gq0iooFR/C4pMbWqReVKnOYmjqpurW9Me5kqRzmz62yMWDQtfRUulBbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p2X6JKI4x2WJverOteF2QHB49hR5/PKwHd8XMi4IFOU=;
 b=AzdXjTQBctJYo0bg+3IEM4GIyHfKa4Wk9Ekdy0mzFc2wTv/YECBJg7NX8gcqpdmvCl0ZmDtDFPvitQGbi9o/cZvyZplVvFLoWAzN+iReBctSQM8UiKYJ1KaRXwG69kE5ShGZWvqXrX1136GaMkoSQoH3AxMSR+nEOu5TXH546uaOzQkKdcDMSd9CMiO2ulzB0MD0sLcElU1EFrao5VmwNfx6+NSc4Vc36HW1lXyJLwSfvCSldydX50RcsbQvyTy7SBl5IQWfwrNYQCvEbTXiQ8/SAZix29bT8wNVZyc9U4Y+XGQ6vsqwuHvsC13OHwo/cNvkLNlVBDvTCmOxO3IFLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p2X6JKI4x2WJverOteF2QHB49hR5/PKwHd8XMi4IFOU=;
 b=pjZmmKErw7o42wmFFQerFbpMlEfe/nMzOT0nLDLT01merC6ASbVSRAgRqom0K7IzQRe/LZ61fAkCG+LCQa5uaxEVbtm3srVndrmzlVWZfTAEHisDpNVzNt3KR9ZwiZtWq2iRcSfff0SotEqDE71T5O+8Ew+aD1HnGt3kk4r5oyo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYRP286MB5289.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:112::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 14:30:43 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 14:30:43 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Christoph Hellwig <hch@lst.de>,
	Serge Semin <fancer.lancer@gmail.com>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	Niklas Cassel <cassel@kernel.org>
Cc: Devendra K Verma <devendra.verma@amd.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 03/24] dmaengine: dw-edma: Factor out linked-list transfer start
Date: Wed, 29 Jul 2026 23:30:15 +0900
Message-ID: <20260729143036.3087722-4-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260729143036.3087722-1-den@valinux.co.jp>
References: <20260729143036.3087722-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWP286CA0023.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::10) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYRP286MB5289:EE_
X-MS-Office365-Filtering-Correlation-Id: f5741335-ec83-488f-7dc3-08deed7df90a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|7416014|366016|1800799024|23010399003|921020|18002099003|56012099006|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/K0EvvTbKmn8jJcM7FS5lKM1aLCE633LpNez3P8D4xUSgLpfeOVkuofV8wGDEu52KaQDm65xP/2oZiH+KDbVisBzTxtrkeqf8oIbCMO0vJcVbCsmhiDUtkMx0ilr9tSmylmgThacS5mlgZRrFL0zQ5/IqEo+WJBbLaeBM/q/rnH6flDRLBhAa95ugW7lgu4VhZQqhvBenFaNXBGOO5dhUtsF5ItY0v5LmFFLRVNbVO7u9tJEcOh5HfY1l3JMZUPnWJnOvBN4fO0iJolHPv+ZI3ZDJynUv5PvSPMNpziTLxwGwtkmsE6GfbjaAPOGOFxkUQPmi6LjTxLF0znx3DHwOdeVfJkyjG57Eo/cH7onnMGBRY91+JMVCR2k/r1WtDuEWfI6UkzYmeAWQADb6J9TpkBjsI9uk5F50GZHGdB4y0NR6OCoY8pTjSSqssL2WwFGg8/aMSKoCdu/7Rl1QwtPypwrmICAx/XvmfJMwGYdbzrENAMtn06Tg/05i+g7CvaVFS3D1FTV0Vep2m+4Sce2/mxqklCcl6wJ4s6HJRGFG5tE8a7LtDmnOSQCk9aA4NYnM3kBoWnGv036AYBsFVmWu+gOzTyuVB7kEBvjgxORvNfZbCb6yxyqOEOshj8Bo1SX+4ILjXyjXJ+BjYlSZ/mUNwksffJZlrfN+Dobbnr+hYafUQPQVt7X4d5Iz76LkMnLnf3ODmoXPDxwMxEgZ2oBAw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(7416014)(366016)(1800799024)(23010399003)(921020)(18002099003)(56012099006)(10067099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dHxo0LlvOtcxSA3g0TdgNnl9S89ZeEHM7DdpgE89FtjLuIrCYG7xWfm6kKHF?=
 =?us-ascii?Q?JJHgbtkM5TdyJqGxXaTAswDYKil4hq7M6D57yKudQZYUxLh28HHSGQFp74Q9?=
 =?us-ascii?Q?zSScu68BEiL4yuJMXzvZm6sqHR26jjG45E8KUybntUtYym4QjYQ8GZW08zZd?=
 =?us-ascii?Q?QmRnYjt5rHvh/7UtNxf/IGd8jmn7aresgghA64LZSM8I1o1Mi8tiDIdwQwbl?=
 =?us-ascii?Q?DLDLDRiiMpSYMCs5l+eLgCEFaRa+n7cQwBXHsxb1x160Zo7ZLijEoJNphRdY?=
 =?us-ascii?Q?Eu6nsnrlcoS/QJENnZTvKzR/N5+aN15B3ibzk7kMRjjnRS2GNIStAZZGt4nk?=
 =?us-ascii?Q?xz0/hoPACkmBISXfBOswrrbi1qVvgcVUthyc6gYjvC2RRQVMczeyaz7KmSbT?=
 =?us-ascii?Q?2viHhjDLxwc03TMNMQjC8yLLBpgV1ecwLbgxJSzlJDKmi/xn2xKZhqYg39tA?=
 =?us-ascii?Q?AeV/feWhtVn/w561bMOutb2dCAlPlMhSLJUMoGOEaDbTGbdbvddzfkgq/eo+?=
 =?us-ascii?Q?EhiQUY7qInL9CmEkLXibOPaj77eX6qW8PYnyK4Qn12BkizQRlMfrd7TR0GoE?=
 =?us-ascii?Q?6IP6qH+rTP086NiCTOqT+TNsc68C4Q/MthkE/tSCoXw6CErUR0+9YhUKLOGC?=
 =?us-ascii?Q?+rmAPwpD1pQ7EhWtDqR2cYWN7E7b4d0rGRhmu3l+R4tqyPD58Qwrv1Qfek4b?=
 =?us-ascii?Q?AUH0RjJ66IbU2CP4wD0sFqbNXmB3jPuI+pzrmUNkpdBXiEHnYMNzcC7RL54F?=
 =?us-ascii?Q?XbAcxzjvAYiSEA8J5nhavEb4/XGMrZ7UkTgggtYGiM5Q3/3Vv1ake6yxB7tN?=
 =?us-ascii?Q?67qYToxddP0ikkGrl17vZ47hDoiUrDAq7H7hdN5e+ZJayesBrwJNrp8mx6FQ?=
 =?us-ascii?Q?qN9T12mTX3xARxeNo/cSC8reRy3FWyoC78T3q07gvL92AHT8zdegKM+XLyD2?=
 =?us-ascii?Q?jNm8JdUDurlAC8gnPECAIx2quAHXP0913Pt0Rhw0/goTxFkPasvlrWDA3ElP?=
 =?us-ascii?Q?FN3bridcct5kg0b4y5+ddZ8Px92tYWHmYz0hdJBBy76IrTvVn1myU2Umtp+p?=
 =?us-ascii?Q?Fwpesz25CW3Ub+6VxyG9Pt5BK6Y248eFa3snpdO/iT4Goe1zNohSMNbfZjwe?=
 =?us-ascii?Q?3iMedq5+NJKvZW9T+0N9q/+FhPBobbbvBWfJe1ZqwD5aYat1Ee46XSKWp/SI?=
 =?us-ascii?Q?Ftbk7tHc0LHyQ7223kWPjgXy2YqQyeliXFhptKsJB1yg1s6Cyt3Gv1G0/BZP?=
 =?us-ascii?Q?Tz2B29PLmA4jDqRo5SydZZSFm46zrLueHGVhhCwwPnfdR0kkGGGukgh6TiY+?=
 =?us-ascii?Q?CH6jC0pT3HZpnkNWXGerY/huTtpEozFt48dMQLiTuD5l5EZwyQe7LmqAPDxg?=
 =?us-ascii?Q?bonTEo12cbH6HKX2MPU8OQCMzMuPuIYqzt/iPH5ZT+RFsQfHp+fYpKe9EpOB?=
 =?us-ascii?Q?JOguv69aHFdSCSrii1S6oa8/VelCzdl0RTnKiIv/yNScDSUSgukOxMLu/O5S?=
 =?us-ascii?Q?JXoi5uuxsUDBe6sLffKMq3KB0TMw9Y+XlEUKEcuQudBgP7wI9DVtdYwngG8Z?=
 =?us-ascii?Q?H0nku1CbtQ/UzAm/krsHsbSfb9i/CIrvRftVvcNlYASPot8tB6W/32QFhiYv?=
 =?us-ascii?Q?gjylhTYUcJ7088+r5t1Wytsa3MT5EIwwhV9pIm6y7M/vRAb4CYBwWuTXesPY?=
 =?us-ascii?Q?KlhdXcaOY8pgGCk7r2tcoyxE7aE+X+lMHlVFtngO51g9p0bf1qkrptkuZK4m?=
 =?us-ascii?Q?FRHySY2ZgfXUNfO3IATcNf3A/pA5SQ93JEJs5kDaCylFsdWWZ78f?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: f5741335-ec83-488f-7dc3-08deed7df90a
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 14:30:43.8634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xTHa9vV3GSSjVsmNA6Mk7LaMmcS6QArs6/NU73ErD0iYV7nSWQGvh67Mie6HXIMIXJp/Xz3DhOJLuspWdwluvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB5289

Move linked-list programming into dw_edma_core_ll_start(). It can derive
the first-batch state from desc->start_burst, so dw_edma_core_start() no
longer needs a pass-through argument.

No functional change.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v4:
  - No changes.

 drivers/dma/dw-edma/dw-edma-core.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 1f893dc54c79..6a25a050b89c 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -67,17 +67,11 @@ static void vchan_free_desc(struct virt_dma_desc *vdesc)
 	kfree(vd2dw_edma_desc(vdesc));
 }
 
-static void dw_edma_core_start(struct dw_edma_desc *desc, bool first)
+static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
 {
 	struct dw_edma_chan *chan = desc->chan;
-	size_t i = 0;
-
-	if (chan->non_ll) {
-		chan->dw->core->non_ll_start(chan, &desc->burst[desc->start_burst]);
-		desc->done_burst = desc->start_burst;
-		desc->start_burst += 1;
-		return;
-	}
+	size_t i;
+	bool first = !desc->start_burst;
 
 	for (i = 0; i + desc->start_burst < desc->nburst; i++) {
 		u32 idx = i + desc->start_burst;
@@ -101,6 +95,21 @@ static void dw_edma_core_start(struct dw_edma_desc *desc, bool first)
 	dw_edma_core_ch_doorbell(chan);
 }
 
+static void dw_edma_core_start(struct dw_edma_desc *desc)
+{
+	struct dw_edma_chan *chan = desc->chan;
+
+	if (chan->non_ll) {
+		chan->dw->core->non_ll_start(chan,
+					     &desc->burst[desc->start_burst]);
+		desc->done_burst = desc->start_burst;
+		desc->start_burst += 1;
+		return;
+	}
+
+	dw_edma_core_ll_start(desc);
+}
+
 static int dw_edma_start_transfer(struct dw_edma_chan *chan)
 {
 	struct dw_edma_desc *desc;
@@ -114,7 +123,7 @@ static int dw_edma_start_transfer(struct dw_edma_chan *chan)
 	if (!desc)
 		return 0;
 
-	dw_edma_core_start(desc, !desc->start_burst);
+	dw_edma_core_start(desc);
 
 	desc->cb = !desc->cb;
 
-- 
2.51.0

