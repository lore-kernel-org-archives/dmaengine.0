Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020119.outbound.protection.outlook.com [52.101.229.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDB14746C0;
	Wed, 12 Aug 2026 15:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786550262; cv=fail; b=asoHBuPaCqA424QpoYF/VAubT3dMLvQoyltLaWRzklz3tdLvmF2Kelvbipjf2MlElBO5IzRjYANclxEMF8hWuiyCQdynPi8YwT75OB+JWFjBJ9Gg/zFfFpPOSEj8SyYONRLbL7GdlM6iRjzYNWLV9/bN0XI35cOQ7/m0MqKof0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786550262; c=relaxed/simple;
	bh=1YkUk/bcF+2K/GGi2xXofv1kdf7pQvgWh0jDeL6mQsw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UPRYNPR/2VPUgkcZSIAKe0Impdi/N6fICRgOUeHijULOTUATuuNxyMmGxrVmsf4xWQWiSQyx/nFvHpaYBpBA9Q0nVGhYEJh33PikHKWw91i8GrYsVLZio4yWyrnnAhd+Hcth7n3RCw3ZqmBpuNPRF7UbIV1OuktbJgBqW85XX+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=hOpngMSO; arc=fail smtp.client-ip=52.101.229.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="hOpngMSO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FHMMkP3iuGbvI93C/LizQ6r4a8OmDEYrdIWpDf9Z65fjoDNxF6UB3h15hFGR5VCKEAh+0++g3dntb4C9DdB5FH4NM93+qDUJB8/Amb2J9pK9FUnUmbD3w+axuJsIDF86Fk+fL5gYCB58+dD8aoRa8jYE/pSinM7J8+i3VnS7BVk9fYXR85OqCg2IZlhaY5GmoD475/DQ6ulqPMJ3uVA9XdcnYf+12dI+pjWzprrgKqtUC8avY1gZ86kQUAZDdE/ohOi4CUoaNeEIZQYg1XOEsTLWW1kVd0cpbZgS9ajyO3Jp0G1nHc668A/jwJtvRHe6e5SiKinITJAoUt6/7U67jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mTNpU4j1MsO/6cX0QYUM2Xqu/UmBBaocCy01N70V5IE=;
 b=qjaWYS1y5IkiyQ3DfL9/K3Z6AlcpLJxaIAwbnqf3VkKC0FIyscjmUdq3vkNls0z/Fg+rHZg3b2gsr3h7669WXDbyU2uLub3qdjRK/uGkpFQTKJNHOR3gKWAxSMPn0wYlnaIPHuJqr6xKNCQnKMZALvvaVcmJj5N5KOnJg8Ehh/6XwRzZNfJm4gewclq2x+aBF1IxSWD5T6oeCMpZyroLoK7DtspmSXhn49cr8QgFW5VKIC0HhUcm6O7TI2ZJika3sK4TJqEY49+UU1dAsuTYsViC9ZY90Tkgn0iX0prDVdJVXaIx6AlflH7ozVXPDmKEVb8qoQ+cHp/rtBt21M2D3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mTNpU4j1MsO/6cX0QYUM2Xqu/UmBBaocCy01N70V5IE=;
 b=hOpngMSO/W9ZnDd6tP8sU0bevrVfwhX2QGq2rr5U110rusC+S0XZys56ZhLqU+qoVrNBgh87Ma7u4D3B7hUEaUpNXbg5uYodpL4UA81JRH/RXbWt5JX9B48zzwVxdTtdIwMMPWoEY0fzfmtmZYVF64RLFQ/G/NqOUGvpRMDOHbk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS7P286MB7115.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:42f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Wed, 12 Aug
 2026 15:57:31 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 15:57:31 +0000
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
Subject: [PATCH v5 06/24] dmaengine: dw-edma: Dispatch DONE interrupts by channel request
Date: Thu, 13 Aug 2026 00:57:03 +0900
Message-ID: <20260812155721.2807506-7-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260812155721.2807506-1-den@valinux.co.jp>
References: <20260812155721.2807506-1-den@valinux.co.jp>
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
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS7P286MB7115:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b0c95c8-368f-4aef-1dd6-08def88a6aa3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|10070799003|18002099003|22082099003|56012099006|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	tlAhfgehvD9NmVptaGaHP80iipUjmG/h3maz3AcwLMezoBbxokkpXyEqzsMNtpK6B2cf8RTuQXh49EL/KjhaPI+vBDMcm3vFUKCdsUgSkELYzn+sq7NEV6/EH+8QM1+N4A/stuLofBYGrCFznJHaQJ6/yYjxERTER6Pfdu3puq8R0f76xwI5+kn+pa/+pdZgv0IbK/5Aejw87uHwxHUJpa2vv8xm2s8VdmhXzB3rz54AHAP/7yKAT6gTm3vauYqnqhYR3UbT1A1qsJrRePDTXYZcZ0JLxbQwokcGNtnoYS7Dsgjcs0zlvgjwiTgjN5Lsv4rc4EwZRyEWeOrvsMwKT+wCz0w30XQeLyCnhrUSA0bQCYt9w4OnKmrfwf4Up6Rub0xsGp1Dfho2lG79Dpfja8gumtwsvNGoFqKV4hUUUc6iJxe068so51AXjDMUC7x4PAP6aDBtrWk84pRM+f+QaRVUrndKCsH1OZG2FdH5aVBzjzScn9bkWeKuhkL09lyAtqIpLKABvFdkPpBl4552OnC4/ATxFElAaZC7o9UJo/Sk+VbeN1LqloM4tP1FFoXi9V+idMLKfXWWI3vRPiToTAHPKKMTZl+80sSPfg5+4Otvrmku5muCWmD+QVuXhepvrIJKdaJt8uExIFaAyfiUhpEME4lhEday15kEgAKZa3HtktbTfbNsgW5bsyhC8wt10xOeWbbhI4Ls7P4uPF6DzA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(10070799003)(18002099003)(22082099003)(56012099006)(10067099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Bn+oinnT5V83FtPyppwFMKQD95uDmvvIdATEiButDsuPVOxYTx78Gu2WLBrd?=
 =?us-ascii?Q?taO1yfrY2OzNuHWxyieznKPWJz92XA+HEQOpFbI9Lh5Sfn89ZyZRmbwmY1bc?=
 =?us-ascii?Q?CtIsWUlbBjckFL/Bb5RKcRVEQ96LBY4F+d0mzoTpIZ7VJNQTjHLP29y4mlpB?=
 =?us-ascii?Q?9nSyfXv0UrJ/ywi3F4DOo1oelWEm78ss4gMRr3jLOcdeP6OQCWhgRDmquzwr?=
 =?us-ascii?Q?Ecds2he0YSoy6xLVp+1fdrslpFxh6Y/12KvplLhW/jTEAFe3lgdGgwNmmPXm?=
 =?us-ascii?Q?3uhr0jeicQlTNHI5aUdQpf0UzPBjcN0ZtLTKdOVXPdBbCufAdkff60TIKQ0v?=
 =?us-ascii?Q?WIGeoLKzn1i4fzUqxQ79yMsPcRINuXG/BKgBPrHs4eP8ftlQXdY0hrPFkPaQ?=
 =?us-ascii?Q?yK5TCsz6HJ36WwnuMriI2yE2Y4CY+9eur9Az16nZOFQfY7hQef3Br7na8iXd?=
 =?us-ascii?Q?DXvxrpFlT2edMyDfmVkXxMSF8bgigY8nzpig4Lk1uoyVoViGdytEH+NE+nSU?=
 =?us-ascii?Q?ccQq9rFXdmPb8V1J6n/2OM6sDt0eHBm09iBejLC7uZY9GKzY6yxKf1b8XStc?=
 =?us-ascii?Q?Tr/uaYYuSCN4OlH+VMaqcFPPcmrd2HISJo1gH/fKzBYUguXkYxjpCHhzq4Qx?=
 =?us-ascii?Q?39LHBu//Mw9t04sMi4KFSpAQEH92SyCZnJYsgdMN8DLnXsQgXNKFwfUjuXe0?=
 =?us-ascii?Q?5SGVVoxZKBUB6Ki5LcFWtrR8XbOs4ayerYaKFItw0zHIZ7v/4bNu/ayfociu?=
 =?us-ascii?Q?nihqgME7u/afH152PF2eF2DzleX4UXe1XLQu6AA+fU1yMKaE2rCDUY5MH5wK?=
 =?us-ascii?Q?+Ns6GbKgGTR2dvKVQDWNDpk7WrO+tq2kIPSLicGqJLwzs9slgyy//Pm+ku2N?=
 =?us-ascii?Q?K5vTayIPYCexoRN79k2Zs3IgFD+F/QlzQMEFG7Z8NVLC4BjsxtoUBCbJIiMt?=
 =?us-ascii?Q?mJObqbMYyD3x2E22I3KTssSiqQbiBvn0lr0lGe5YbTEv/NEdkcvwh+gM57oe?=
 =?us-ascii?Q?Y4NzGw4QGmivUTl8fRZ5B0GF3V7OllIgNsnOjC37O9XVlD6K7vmtaAogtccD?=
 =?us-ascii?Q?TOqh1dJKKbzM5AfEDNkiJ+B0EdKQ/FSgPHu8fhOWSL3dVoAYLfRjQH0ZIVO5?=
 =?us-ascii?Q?qcOg8zg7N5IlPiTMELeCzqvAtm2jKhmKDctt65uEVApmWN6OcbVJoK5/mUbF?=
 =?us-ascii?Q?qed0RXn1XBK2GwD2JDxKUvR7VMs/vFEYbu5/LVYLsmo1rP7oZHRCppquv9Uc?=
 =?us-ascii?Q?SDwQSJNvmJ84zI/SsrTCqQotNK9BumIzEiIjLLJtoE56O969ddhXeo1vObTj?=
 =?us-ascii?Q?16U3uI0mpp9vAipJd25fWRRIEZo5EuZTAjpfETSuebmPs4fo4mNdIxqJ4Hrt?=
 =?us-ascii?Q?3Em3H36kRnM5PRdHfUAWPpkWdOwB8tYXA2GHLAPCsLK1nf2EwSM8XNCBz77T?=
 =?us-ascii?Q?IuABLlfY6Z33rUOby2C1UKy99aA/k0hrv7zsBnD+qE8ZBz8j5GYbVfXG7/tx?=
 =?us-ascii?Q?IYkfo5mqFDOFgr8FdVYZMqw9FMPZKu57tpOB5VzB4+0rhi3pGXmSB6NNGLLM?=
 =?us-ascii?Q?ZdnE3QdckLrImmLJ/5YzJ+4Y8oe3auVB2Ok5d10fR1eHJKk+4P+jS3wJiX6A?=
 =?us-ascii?Q?485BoFRT1vhZa6UoB5l+RIYrI9bk7tcQAKyZBNxiZtg8gKh7eyc50NWP7tAO?=
 =?us-ascii?Q?A5qlr2mvJlEVpzlRDjUuzg0B/9ZAy2bJib/CsI6arTA6FlLL+M9jOM+8POz7?=
 =?us-ascii?Q?PzpdJ1eZhz7Ju9y7jy8iBZ512KcdlRpDg0YNISPlqj2nbhWgrAUk?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b0c95c8-368f-4aef-1dd6-08def88a6aa3
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 15:57:31.1942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gPhnWEchWH2J0Zy8dAUK84Ifcyg+aT7kY2CuKXh41F0NzPw9avi8l6jS7W8n2RUyfy73yPfm01uzdwbJa1Jkkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB7115

Prepare for a later patch that reclaims LL progress before request handling
and can remove the last issued descriptor. Move the request switch outside
the common descriptor check.

Keep the existing per-request descriptor checks for now. That later patch
removes them when STOP/PAUSE handling becomes independent of the descriptor
list.

No functional change.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v5:
  - No changes.

 drivers/dma/dw-edma/dw-edma-core.c | 56 ++++++++++++++++--------------
 1 file changed, 29 insertions(+), 27 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index ab8e343f0196..3c1f3f728875 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -697,39 +697,41 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
 		return;
 	}
 
-	vd = vchan_next_desc(&chan->vc);
-	if (vd) {
-		switch (chan->request) {
-		case EDMA_REQ_NONE:
-		case EDMA_REQ_PAUSE:
-			desc = vd2dw_edma_desc(vd);
-			if (desc->start_burst >= desc->nburst) {
-				dw_hdma_set_callback_result(vd,
-							    DMA_TRANS_NOERROR);
-				list_del(&vd->node);
-				vchan_cookie_complete(vd);
-				if (!chan->non_ll)
-					chan->ll_done = chan->ll_head;
-			}
+	switch (chan->request) {
+	case EDMA_REQ_NONE:
+	case EDMA_REQ_PAUSE:
+		vd = vchan_next_desc(&chan->vc);
+		if (!vd)
+			break;
 
-			if (chan->request == EDMA_REQ_PAUSE) {
-				chan->request = EDMA_REQ_NONE;
-				chan->status = EDMA_ST_PAUSE;
-				break;
-			}
+		desc = vd2dw_edma_desc(vd);
+		if (desc->start_burst >= desc->nburst) {
+			dw_hdma_set_callback_result(vd, DMA_TRANS_NOERROR);
+			list_del(&vd->node);
+			vchan_cookie_complete(vd);
+			if (!chan->non_ll)
+				chan->ll_done = chan->ll_head;
+		}
 
-			/* Continue transferring if there are remaining chunks or issued requests.
-			 */
-			chan->status = dw_edma_start_transfer(chan) ? EDMA_ST_BUSY : EDMA_ST_IDLE;
+		if (chan->request == EDMA_REQ_PAUSE) {
+			chan->request = EDMA_REQ_NONE;
+			chan->status = EDMA_ST_PAUSE;
 			break;
+		}
 
-		case EDMA_REQ_STOP:
-			dw_edma_finish_termination(chan);
-			break;
+		chan->status = dw_edma_start_transfer(chan) ? EDMA_ST_BUSY : EDMA_ST_IDLE;
+		break;
 
-		default:
+	case EDMA_REQ_STOP:
+		vd = vchan_next_desc(&chan->vc);
+		if (!vd)
 			break;
-		}
+
+		dw_edma_finish_termination(chan);
+		break;
+
+	default:
+		break;
 	}
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 }
-- 
2.51.0

