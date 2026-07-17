Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021086.outbound.protection.outlook.com [40.107.74.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102923803E7;
	Fri, 17 Jul 2026 18:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784311617; cv=fail; b=mqEiKeJPD82CFBMu8vp6CAsauxaGqQTmmwL+YBJWBL3vhZZPPVCd16bXLsKuT8J9QEZ8IDjJJYunF6W5MtOa/1XBmbpz4s1sgeIdkhSQ/kQSKAHEtCnsHdDAg4ppN3ENvvLeWL7wuhSRZk1VdyWEYsbKZSstKhahzKnVdE7rdfw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784311617; c=relaxed/simple;
	bh=o/Ju7gQaewXvJTbgr9O9B+0r5Tb4NYBiOMa7gCG1F1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oD7dXpFHTV5fA+KbRHsbcJc/U700O/gUa5YFh6jQSqaDarFucVwsGkQDQhDWzWZcRoUErnq/D+CBi30PZuz+giKaTPDXpNQSR4h2VDfyOprW940/AoHItuPS5JXRgmfS6DAMEXuwW975s0fcxjBvy9Xc2l7lortRXiX0if8XDJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=WrCVFUsm; arc=fail smtp.client-ip=40.107.74.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="WrCVFUsm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xf3wWZ3xDjDAmfLuB/lcQHsX1J9Ml8Q53MRa1nXPt+2+T0oWxzbY5Qu5S+Y2yHgiYEfbscGgzxI9Me9rqMi3vzi5iSlo3uq+u7jto5MQqpxfZ9vbgitZQI3ZFbZIYX6i7wAjOcPmGulypZ+FHgMWN6KwvpNqOtDrD6P3LyZ8Bj5Y6jUtRNzuY7rNqZHSse8Qx/qZViHLtacrt6qzd6V4d1hJyP0qoWpQ7Q3TRNXJH1c1xYMbVhX4TatzVIuI1CKik0WVRxSOmW4cfjJEkkivUInmV9P9VUcMrJFHox2/FLF02Zohe9/54mBYibhZdepStWJNnmmsKfe6/OyaF5PHqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kK8ON7MvlhyLFRQ86G9zTZQnCfGdjaUCcnQcNnAV8RY=;
 b=ldUso0jxPqHFOC6SAPrvcgmSa9/9mTkhyMM6QWbWHGm34hZYPNLzuibG7+TG/CKjpOcb9KvUjW5eoIyM9DKIb0Ann1whK9ZDkkZLTuvvpUYMv51p8QN1j4MLIQjHWfEWCELY5e46U5texusJbidpQfG5wCxTOQnw9M6f3op06Ddeo6YRUDuws4Ar145sO4ZqP7LnjfoSsWom1SmhavYIvf2fR1n6fGwCh6FhYcgBOJgchyl3RD5TtoSzAKxviJloz1T+R8mmqoDxZeZAtHwOqG6hK9GAdnc9iyGoHswDu4vR5CxDGQjaY4wSJMLwh3OtY2rLFYem0N35Px6wo7IrrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kK8ON7MvlhyLFRQ86G9zTZQnCfGdjaUCcnQcNnAV8RY=;
 b=WrCVFUsmtgXs+RVwSqsulZwSECc4jERnL4G5tX3U0RhiiwcUITa+jpTjzVH6jd82gmsyiVvCCMRjOIcdB2T/A0Bcm4+cMnPAaQB5uXdJd0c8gMAoeBYyE0L/SaxsoOKCjrumKj/jIYDmO3QtomZDWDw/WuxpaRN3X7yPeW9o3oI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY7P286MB6260.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:327::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Fri, 17 Jul
 2026 18:06:48 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.008; Fri, 17 Jul 2026
 18:06:48 +0000
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
Subject: [PATCH v5 7/9] dmaengine: dw-edma-pcie: Drop redundant pci_free_irq_vectors()
Date: Sat, 18 Jul 2026 03:06:37 +0900
Message-ID: <20260717180639.2643243-8-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260717180639.2643243-1-den@valinux.co.jp>
References: <20260717180639.2643243-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0124.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::6) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY7P286MB6260:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cf4f07a-b58c-4e15-81da-08dee42e2b55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|10070799003|366016|376014|10067099003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	4vraE5zUDNTFeNhLqSs8KnhRxF+F97/BD3ZR7FEk9GY4Pwm9wKGR8h1ZA5qxipdpcBaxoted/8bg0mS3qz42ys4zLfpguOBVPRNH9KIqaWXb9z1biJTa5a8jLM3kBkCYRFikDW8+lOgnPk7OCjNrvn4d7y5BzsVi+KC6YFdtLZzD1HyxaX98g563Qy3A5j7IZ5GfGxldlwHM8N225hEBkZNmfAgLNOnlipkSBEvSfSB663LgR+1ERzlEBBRQeHVSv9ScwWW/SwWNxlGnLnYWsTE2B0v3BtE+yKsEwOi52Y5KcYzVzfdIldYP1hLGh7AdhYEFndq5E1yTTB4dKWwgiD8GZZtSD1GzyOYcq3NP+iDbgnAz5a3ktY439pMWPiG0Q+taObZ8XFOfENtlS3+Dh9Gi8gU0GcKNBXzV1+PolzAcfDaDbijZPUpNDR2RZmfLOdosvm+03vMbyoIU2S48DiOl1PeUt8YKab9wa6C8MybRrYh43kWeOY/ADm5qeopDd18IZ0nob5k6Bcfr6AbGfa8pmVG6c3ulCkh/6dRmX4ntcRirPovdMKprucAQMDKtwny9APA0oGZMCDx4NjHn2jiMvCWSGTjhIJ/fONniJ4HUqDyZ8NiwKcPFWrhP3CqxRJlnmw8NrdYk8c3lJV+uFtJkErhZ2q6XXnScPx93GO8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(10070799003)(366016)(376014)(10067099003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mVkkm4er+q/vyhiEGlF6iDgO11rRJjDo7Vd6vm5QP23qTsA4wIdrdl2XerRb?=
 =?us-ascii?Q?NYHphuW02CtCjrXV7gr6BfID+mwypGTJQTufl3B9jPwDuLIcODGDA3qSf73c?=
 =?us-ascii?Q?iARZule+sUr9T79ySdkFq9jdnUEGot0FvimYM4LkkVRuwG1of54iGsdF6/DO?=
 =?us-ascii?Q?Ij2s1vZtLk+Js9ij/1PkW9ZQh4gykYBE5eZg9JGS7xRb5X5N1oq8ncCAzcCo?=
 =?us-ascii?Q?2N+Bdav+2IpWyD/vCuRlgyuUrqKILanuHnpAESkjrMNN/I+01ziHw+ka3t39?=
 =?us-ascii?Q?yq46ZJv72A1HUtVK6Xk4R0NVf3sRa46voVuY3bEdzeUaMkCvHHwOMJ6FoaZu?=
 =?us-ascii?Q?7mRoQ/kzPR5WDypQAhLUhmsHq1P5wcmoAI5Z3j/7spEQsVdr6RuxAn2fOl79?=
 =?us-ascii?Q?zTlo7rMIWwaaAG8Fucpj18/mST0u85gfNtmRixqNZjLwoFj7IBTvQ2H6pf4d?=
 =?us-ascii?Q?ig2cY+5waB9nrmDcWDRhcO77kLP4StLnGQDMkRCtAhHh5lz6PVEui3Nq1C0v?=
 =?us-ascii?Q?LvZHTWLWUSJer+y2sTKSxl9JeNG5sMG4TZm4nmWtDfmDmUsK9sABefdKMEru?=
 =?us-ascii?Q?P+QhNPHRMTyGdXSDs7BZE093RQ+yD+giuk5NxOndIIKrVWpStMw5GLtT/xyQ?=
 =?us-ascii?Q?0GzmeH49durmKzHiPlEugfQDCgPzX0jThypAGIPtMcRPDZyBK+0VN/Xzc/mC?=
 =?us-ascii?Q?fCpFxTJldT0BbJ8qvD3LGqlBOXv0pXJ8d3mQ+KO2GLzxBznUh4kvO0QhSJ1D?=
 =?us-ascii?Q?hr6DgxxTEXqy7RRphPGfJ+VqPvlSUB3Mjj8KMZp1y2SbCE81X7vhz9izh8Co?=
 =?us-ascii?Q?r68a7lvmjmZer4rjfV5YXS7tYx2llGCXjqJ8EPs51Xdxifvjsy2ohYiGLZ6W?=
 =?us-ascii?Q?b6lTgQTUuc+h4yhL1GtBCy2lrwQoBeP2mFtyOIFeKfVX89k5W68VxVOpgV70?=
 =?us-ascii?Q?BhQMmSZD1zhD96VqJuMb4S53g+A7/pFa5QteofPUb97BDgkBgy8wDjbCU1Gw?=
 =?us-ascii?Q?x9EVO5Lqck+tpDAXIKN7Tjo/6eEKfUCE1VyVV0hpXCHczZNQWBHJEjH0OYSh?=
 =?us-ascii?Q?o5m3DMUVUgki8oCH/GnBsIch2EJTUxj1OVAfmU6woJXGRNbx+jyxlojykNcU?=
 =?us-ascii?Q?o2np0w/GExwUfHyfXHSGI9qYcodq0fc3oZ4k4KWIYDQkiejCNuptpOxjHFBI?=
 =?us-ascii?Q?SdYMaErP/n/GdZIk1yDWbH1/HArCqffdQoAMSY84Qfx1K+l1um7j59Ftz7Zg?=
 =?us-ascii?Q?lRloSWn5gwOQeEBecsHrdvbyczQl2d/Dd48yAz6bIvIVAGY91z0sVKsxdHiq?=
 =?us-ascii?Q?qAO/Dyq/SoMb6iobSbWVI25dZucLLAGREdmcb/Ng4o3YS8oVgtnUOHutX193?=
 =?us-ascii?Q?yru3xmNyVyb2r6Nm1F3y5SO+qQMyL6FoNGkmbG/ePl0tIHY0n7dHiGQ3mmNO?=
 =?us-ascii?Q?lj+tJM1uOOI1f0lWt3N80LdYwi/T3/f3GQniKSRxi7HkvHwPZ9mnBh1mR6V3?=
 =?us-ascii?Q?xhXrQnfsUf+hDE8UnSu6QMlmngwLA9fmGf8Wki9WjTmPcvaHQ4JDDQ4AivNx?=
 =?us-ascii?Q?YoaWNhaIJW8isZYJHj9i29VPXxzTFBdafVXpefINxiPOYqCgS8hwx898mDPX?=
 =?us-ascii?Q?9glAE5pbzYGTs7bqWADxq0vAYSQ8VY+cCEIWC19qM/br3/jPk3apPoZCQsmu?=
 =?us-ascii?Q?Zljayu/cDskfFZ8e95E69dGuwEA/1EEDCUhusThhNADTj/qVGa+2A6pcCZ9c?=
 =?us-ascii?Q?1LX6xEql0h0rGOylxj6u3j0d+3s1g8ZmfNKMi6saP7W+WLT5eTUi?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cf4f07a-b58c-4e15-81da-08dee42e2b55
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 18:06:48.0361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EnmGpIuYaEO0qW9FQA5KKaQC8wP5qEYLFv9BKAJgyDJV/jAhC8Bucj/zFF6ovqhb8pEplc7h/rrfA3GNSgE+nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7P286MB6260

dw_edma_pcie enables the PCI device with pcim_enable_device(), so IRQ
vectors allocated by pci_alloc_irq_vectors() are released by
pcim_msi_release() on device release. The driver should not call
pci_free_irq_vectors() manually.

Drop the redundant remove-time cleanup and rely on the managed PCI
device lifetime instead, as documented by commit 03e4905402ae ("PCI/MSI:
Clarify pci_free_irq_vectors() usage for managed devices").

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v5:
  - No changes.

 drivers/dma/dw-edma/dw-edma-pcie.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-pcie.c b/drivers/dma/dw-edma/dw-edma-pcie.c
index b34e1e45aeb3..db7f1ea35bf3 100644
--- a/drivers/dma/dw-edma/dw-edma-pcie.c
+++ b/drivers/dma/dw-edma/dw-edma-pcie.c
@@ -555,9 +555,6 @@ static void dw_edma_pcie_remove(struct pci_dev *pdev)
 	err = dw_edma_remove(chip);
 	if (err)
 		pci_warn(pdev, "can't remove device properly: %d\n", err);
-
-	/* Freeing IRQs */
-	pci_free_irq_vectors(pdev);
 }
 
 static const struct pci_device_id dw_edma_pcie_id_table[] = {
-- 
2.51.0

