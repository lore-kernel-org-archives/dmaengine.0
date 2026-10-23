Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792756742;
	b=R60Hms16P1xese+1VF/cvRfilszP+PjC3xC65qmpOjkNcUZuMT/ZBUqVkBccjBq5RgVc
	 UxG1Mk/Pt1aX+Vj01h3TNcIxDSLpK0pR/O9BfinKxbSu2zIl3jc0YMJsEvceYf0ORb6At
	 /9G41exJmKJOXI/0aWpd1kkf3c9BJ3+NCh4WY98pjplw9zqAxHhWWWhRQtm5wSD0jnZg3
	 2RRUPcSP77uqtmZVNORVmYPmPB98ju4aPbSbaHisWTI+/7TX3Wb3W4O5oZeCDBbp5xUlT
	 d1MS8m8gPzW2XWGXX/9DSGjWigCz+HZBY1w3UyhKvBduq7hHPgpCtx5o22Dpo0WLZUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792756742;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2bw9E17RXi+krJiTDPyGtQPi52S/lX069ydJNo7pBSY=;
	b=C13PVTHm9XSVbCWeSwvbd+67CjLe9ljpx5DZ2RpLyQqeAHi8uIk1sMf2MM8QP19De1SY
	 zsx2gXx3bCKkam8HnIID0YHPw2WtaqwyyOe0YfVqlmlmuWBMubi3M8gwQ2RaWWgubkiNM
	 5jCAbQqEbJ9G/01OHTCTSjYNZdxb8WzGARuIdVgyz/+tkVV1PJREKOvLEwM7zhze5IyoS
	 u8uKV5RNMW4qWSUCVLybZK0mA2mIsvSsIPljw3HfGS7oAzTqiIjqaN85jvz0s+1B8MVfh
	 D1ZBnLFu85T8erfarbaEPxPLsyDWx3m/ICB5LYFvS52a/MZh+Y1607gdKMoSYwXmmtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l3wfenE2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jo65iNhT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB15606A31E
	for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 11:59:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAB15606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l3wfenE2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jo65iNhT
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAZQr2509078
	for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 11:59:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2bw9E17RXi+krJiTDPyGtQ
	Pi52S/lX069ydJNo7pBSY=; b=l3wfenE2ZHB60CPyIma8/VkDkD7J+qYUwMli2w
	frXoKqLyTiIByg4qLJyEZ+iYf/uJErnM63B/V7qDmJYkzYJC1oOvGRkPMG30iBzz
	OcEDvUQtsd17psLytKADqiIMFJQ4Sb4ceJbRbESEtkjO22ljBqSn5ZifvawquF0M
	kJMpSpMkAhDi0SUBjBCzvL3cNiRUTFaX6AG+TWkiEFXGZICDOOkrixEi9nvhbbf0
	I46LwY11VUTX9qbWR+rYvE2HVoMXAbZ6Q58YXNhZFuQRWtCW/skcbTU2V5xc2QFW
	66GNldT5z7FTCLhXh+7Im5HPUQVQV5ealMOMvddKXTM3HTjg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsykay5r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 11:59:01 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so2060157eec.1
        for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 04:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792756740; x=1793361540; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2bw9E17RXi+krJiTDPyGtQPi52S/lX069ydJNo7pBSY=;
        b=Jo65iNhTn/zYFm/xYxmvcjShWFzKZpIefghGhTA41xUlU1qPwKOE2GS9WVOyq1WmPx
         ZnWG3Kfp5VMa4GR8aP3F5ku9yIpQxlJVUCclDNSSpoYCc7PpM1D8Al6qmxO8DoJQ2iIb
         GpqrSDXyRQzWyCvUCRn1/O2HrUZycs5J2HlPVx0kga2+yEd1BvZQN/mBckKIrT2v2wpr
         7NuaVpHa04+G6ig5poxgQi+TKFBW1hazn4xqryEtRqriSbxQywrO8dSbF81lhjgn9l+4
         CWkv//hoN5Mlc4WDZv53nSUirATixTEyaTFpyc0NL94J01/x8nG5iVU5nvrEHJJHGLU0
         Mucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792756740; x=1793361540;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2bw9E17RXi+krJiTDPyGtQPi52S/lX069ydJNo7pBSY=;
        b=DnpndgQwpgmg8/xJ/VisbOmYMnwmFzg/y026KKIAij4GJbS/ANCnA0MLPfBMZqcv13
         1rS74fcEi1JJQwHZUOK0fsUT4CO+Vikjy6DIlPq+tscJ90Jxm2w2sOC+fnyCMIUG7rgh
         hK0bmZHZd+dM5tmbpql25mZ/aL7Ekjv4iImMb1aTlHTwZ4ap2AhfgdK2DszRt/mBB2Tm
         GiNBTmwXOX2BAey2sfm7bqutZXiOvcdARijmTxnwR4aweH90/V83xzoNarHHucQs+ypk
         17wb867YUBBwmgkh1wQWkrxhSkxyZq4v6kKxz+8E+O6C9woCkH0nhFHgrFf77PiiQDN6
         sfVA==
X-Forwarded-Encrypted: i=1; AKwUvBx91QOKd2wd+rlUHnTCAxwvVOHdMuASpIAA9EOtOf0d2O8VbjZ7P3lwleqnB5lMglStQ9q+SsR1ips=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMGctI6ykrtK24fmu0fZ0x4Mm3/p06bjALNyhVZw06+v6wWRrw
	3pGXOt9rmb3MUeebbOtwvWHl/lwmLZ0PvLBIOZJLW8u9IuPf94ANSK/OIMo/DvQyFGnVx15MvRX
	Tnd/nsiY1sAeSWVu4e5KfaA8zCUgKz2ilH21s3lwWwCo7M6ROp2X7Za8O/cesEJ0=
X-Gm-Gg: AYBFou1N86mCqSEZsS0ZUecaiPZQqWqsv43VjzeRfSyXqsgKWHte1MIR3jQpb9bCiCp
	uuRL70NECAQKS08vAWDG4lJhV8yAouLvFbaLPQ9vu4FSz836WC5y4kmt0jzH7WMD+8PkHxSEEKj
	fRXnEGooLJlqk4oB8He5erTEOX7vWPP/7FPpEJOIXWo3Azio8msURxpq5rtH6oVVU+1bVre7FVP
	K2qrUE8fRSXrHo6xaZTrZgHTjg4XGho3oG7wpC2wMcCrQork0QgStv92JcHg2/bFQl9Ex8LC1K4
	M+Q5yn3GRnFC4K+anLcyBPklTMT68sElfawu2Ll2PDYaYRLUwzUxXzKE7JtXXjjkKr6njdpDMyJ
	FJ6osblJgAnB8Y2yhN43NOVLrf2Tdv3S7fA==
X-Received: by 2002:a05:7022:3c8c:b0:195:33be:15af with SMTP id a92af1059eb24-195c77a5924mr2026553c88.40.1792756740068;
        Fri, 23 Oct 2026 04:59:00 -0700 (PDT)
X-Received: by 2002:a05:7022:3c8c:b0:195:33be:15af with SMTP id a92af1059eb24-195c77a5924mr2026513c88.40.1792756739414;
        Fri, 23 Oct 2026 04:58:59 -0700 (PDT)
Received: from hu-arandive-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9d5ea64sm8786134eec.5.2026.10.23.04.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 04:58:58 -0700 (PDT)
From: Aniket Randive <aniket.randive@oss.qualcomm.com>
Subject: [PATCH v2 0/3] i2c: qcom-geni: Add I2C bus recovery support
Date: Fri, 23 Oct 2026 17:27:56 +0530
Message-Id: <20261023-20260826_aniket_randive_oss_qualcomm_com-v2-0-93572b453d6f@oss.qualcomm.com>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMVL22oC/zWOTQqDMBSEryJZNxLjT6Wr3qNIiPGlvrYmbaKhI
 t690eJmmIFh5luIB4fgySVZiIOAHq2JgZ8Sonpp7kCxi5lwxquMsZpuhtW8EtLgE0bhpOkwgLD
 ei88kX8oOg4hC60KXusyrnPGOxLm3A43f/erW/LOf2geocdvfGj360bp5ZwnZ1iPHG0WuRDt54
 UDZAG6mIaMswuSagTpXui6ukSA9CNIopFnX9QdCRrzm4QAAAA==
X-Change-ID: 20261008-20260826_aniket_randive_oss_qualcomm_com-84f5f536302d
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: naresh.maramaina@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Aniket Randive <aniket.randive@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792756735; l=2244;
 i=aniket.randive@oss.qualcomm.com; s=20260325; h=from:subject:message-id;
 bh=NmJjBHDfXQz62IkV9SBv65bKmP9Q1LBo7h4nvQNn7oA=;
 b=+NBv1W2TilmwVmT33/qPxlpLi4rZUaDAKzGTntjNTDeSkbsS3gR96OtBtECoYIXQjJnVOjDOs
 /1Bh+N+mxK3BPH4Mg9AKbkoq4MWXVlAntyCorflikJBfTGwixQaEaPh
X-Developer-Key: i=aniket.randive@oss.qualcomm.com; a=ed25519;
 pk=4o37X1ZqGbCO/T2SR8kq/HnWvq0yb1RUlFuNukovbQk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0NiBTYWx0ZWRfX+eY/WixrkFAd
 PHb/NEEdpkHx7MLZYGuj5UfrrC0nsCnosorvLxYMx5l/R/U6NWjl9s0mSwVMKPztptz4/3TLqa9
 pmrtwPCv3ZAxLu9JgA8zQPXTy1dC8tE5+EG7qIEEDYjKApHVnHV73DR2b1hPO7Lt5zIxEw/qbtO
 BIJffm+DMq9Az6PYwIO8i7rydg+i7U9CFpjAp/6P8Z6Dufku92g4YSAykHv/NUB8lWVxhP1DRCH
 yfH/nXCBKrxye+kc2Bn0Z7/eTyXgiuTf/eX1n0wnnIy+ppT6G0KyZfkmgwHW7Os014vl9MI7+td
 wX6x7T71OJimc5OnWxaqsAkcoKONtqHOzpMu4g0aAl3hW5brcM3h7NCN7empdNf1V56dSyttX9C
 /8v7AmSRg4tHStlj35dQJtp4QR2PiLMgwrlIUPNvHtvwYnoZn1DN2QYlEsBzpdphlyAT8u/e8YH
 s7pb52nHSe09BlT9pkw==
X-Proofpoint-ORIG-GUID: Qm43-9xjf_AfiIMsU_T-kEYF-AhNM_IF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0NiBTYWx0ZWRfX4UPVbZEGNfqI
 H7XqbzAuErpZQf+wKjK4i70IgETqQlLGafVp69U50TmHi2v1x65Bx+3vExDwsMFyy6UhPIfQMf3
 E0gIYAkBJTlL+aduTAWD0+5HXPf51A0=
X-Proofpoint-GUID: Qm43-9xjf_AfiIMsU_T-kEYF-AhNM_IF
X-Authority-Analysis: v=2.4 cv=GLKdgeNK c=1 sm=1 tr=0 ts=6adb4c05 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5qjwvz7LsgNgZhFB2CoA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230046

An interrupted I2C transaction can leave a target holding SDA low and
prevent subsequent transfers. Add recovery using the GENI I2C_BUS_CLEAR
and I2C_STOP_ON_BUS opcodes in both FIFO and GPI DMA modes.

The series adds zero-payload recovery opcode support to the GPI DMA
driver, registers an I2C bus recovery callback, and triggers recovery
following relevant transfer errors when the bus is not free. Recovery
checks both SDA and SCL and preserves the original transfer error.

---
Changes in v2:
- Rebase onto next-20261006.
- Move the recovery opcode macro removal into the DMA opcode patch.
- Check both SDA and SCL for bus idle and reject recovery with SCL low.
- Share the bus-state and recovery-trigger checks between both modes.
- Guard the current message pointer when checking data NACK status.
- Reuse the FIFO transfer abort helper for recovery command timeouts.
- Use the adapter timeout for FIFO and GPI recovery commands.
- Preserve the DMA configuration error code in GPI recovery.
- Link to v1: https://lore.kernel.org/r/20260826-i2c_bus_recovery-v1-0-203f0ec76f84@oss.qualcomm.com

To: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: naresh.maramaina@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org
Cc: dmaengine@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-i2c@vger.kernel.org
Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>

---
Aniket Randive (3):
      dmaengine: qcom: gpi: Add I2C bus recovery opcode support
      i2c: qcom-geni: Add bus recovery support for FIFO mode
      i2c: qcom-geni: Add bus recovery support for GPI DMA mode

 drivers/dma/qcom/gpi.c             |  30 ++++++
 drivers/i2c/busses/i2c-qcom-geni.c | 197 ++++++++++++++++++++++++++++++++++++-
 include/linux/dma/qcom-gpi-dma.h   |   2 +
 3 files changed, 226 insertions(+), 3 deletions(-)
---
base-commit: eea3fef32a9cf36abcb5975a5a594e4135a6b026
change-id: 20261008-20260826_aniket_randive_oss_qualcomm_com-84f5f536302d

Best regards,
--  
Aniket Randive <aniket.randive@oss.qualcomm.com>

