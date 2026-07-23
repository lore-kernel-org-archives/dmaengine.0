Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB88D4EA37A
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 17:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784826593; cv=none; b=HuNquXNDWPVaC6+dWE/Kz8fGuhenA4N1a+U9mcTXdDbSpHihLkB0+8LUBvc/swHtiQFgkO5M4uc0vAC617xihLzhSEC5CZIQb6FS2TgbmaUeOhoZcUjGk1w7+m/ifp8KsTj3VmCno7M2ONqcecUgYw9QJ7ePVE5kAQ93LkvOHO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784826593; c=relaxed/simple;
	bh=nj5m9ijTg01Sv7G5xlvZpgjtZ3XQgHNQrjjJQhNgYzY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=StklB0Wv9JBF3r9YkD+lSImbNGrKcKvUN0MSdePTXJNv10kIhdO9uF6KcZ8vo1iD0R2gt4OKZoxhnlTwGQh1Dyf4CWKjOOC4uDFnszPd7MZxeRJUMvwgvpUiLBxVJnF2k1YA/S7Y5cxwJLqS321XgC9bA1J8m1EExN8vyK3KMWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YhPxcIgI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eMd4szh0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YhPxcIgI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eMd4szh0"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvSkR154404
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 17:09:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GJxCO74foxEAJs+D0TWefM
	RnGQQSy52PZ9443j42Fg4=; b=YhPxcIgIdtNzWRN1Z1KPt1YWHEI23vXsYgY3yS
	Qd/c4E7KaMmG+aSRXklYLuchlgPK7P8WVl6XrDe7/kuN/9lPek0bjb+rzs4LCJLp
	uK4plpBD64QTpJNnX3AgDpNbTxBZOqQdCrPfZYN9M9j4QleeeWKNHPlLMWwH6IOs
	RJSmEb8yT0pGrOCfTRBv1ZeXYGagn7u/YCraqFz1MJAiT7kCv8NEn0AEDH2bF8BK
	CPs0Bq7L365Gd4jfVpVY7vXpE5XGQx02oEtRyie5hDiMKGULiGQs2LOFb2VCBNtQ
	NsfbfFx2cF1WlDRRWQporPn5Z6QKeLu10ZOFuT+bwE3/H/jw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk7b5461a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 17:09:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0e702df8so17115151cf.2
        for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 10:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784826576; x=1785431376; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GJxCO74foxEAJs+D0TWefMRnGQQSy52PZ9443j42Fg4=;
        b=eMd4szh0wE1S/U+KLMMBS41PXXoDYnD3U7wnUPVoIkuPa+XBh1eUuOSMfEcrZVuEQq
         VfWa2aXlP0MM3G8bPw1BdkDB5Oz4d/BypS0HY7OWJjAyHrzWr6wKuaRh1toOLWRE7I15
         y/ajAgTkxiPMQdd7ux6NtMzbyAn1jpY3NuSTkMVR3fRRRzHyOfqpIPoDmq32Sty8KaoG
         R1ck8gkp3iQbkkv4AN9sxEdfKFztKCh6JETkkmvMJgb72wILOcQDHDGpDjurRd95Erz0
         1rvySYu6cH9H8WnIi5g9Mb9ZnRzHY4b3B9gIxett6h7/dBD/Dm9L5G9lJBjZntGoIfI+
         k5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784826576; x=1785431376;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GJxCO74foxEAJs+D0TWefMRnGQQSy52PZ9443j42Fg4=;
        b=JYe/Y+wU7mQZXc5pQUHQ0KlWPowPQDdp3BS0gDT+MiDEPkN/EyaG0Xq1vonDSybsSO
         w4KTIseTUejM+PuhAsTLSiEp40alU12XxD4l6po9G2WJjVx1pMKhR6iMWphy9S29p7A3
         Uepe/qlankFeWMUXD+lhN2Pc1lpLqCwtIkQxqOQJZuVCDY6II2+/MONAfy9QleGdkjaQ
         /6jsRZ4iNl9xDQIf78SZsd5MIG54l5VN87xRXSGbbIeIhqHUVivPWPlx9cHz2ZTQHmZ8
         iFdW2CCgwxlabDFEtfRaswBh4gDbs7pvAcbKLfPrpXJwa1Ktjz+CG0O0+Vz3NWV2oQVg
         DmjQ==
X-Gm-Message-State: AOJu0YxJbVTC3EWIUPatW/dQAESzSsDaE42KGNnLk+3DdIbGQm3ChJHE
	E6muL3Lbn/o8CGttdphh0hfI6Qd7XcHXTD+KeL/mVd2yt/2pQaO/MCTHAdDtdpi35nIrmSxKaVf
	0FDLJEBHX4gZwKpxP5vXFvvUgdOOezJ+He4ofi1YOsANLakqKecaMnzZ6P7YTykM=
X-Gm-Gg: AR+sD11pXexEcN71UzNZ9nnPUwR+qdyYEsSPQmtx2ndW1ttFrasadqtLyfUPKWXwm/Y
	ycasxUBReUUAStwrOSO8Mu9YIYTBu4Bsf+ExhzldMOvpcJMluA+r/roKpXWmvblTS8MXD6JNqhz
	/exMHkzcL+PZ1S5+8dVGdXYMUHlS/eHmpp2gxh26a3V3YkdaA9+7LC05BsY4SPCyVkviNWIWP1u
	oTNQRpDAoovsCqX9PcMb9kC0s6u+25pP26rJ4wiIz8lg/hAzw5oSHugYJeb/pMTEPsBssZE4hCZ
	kA4ER104zRncXmGfOM7C/OSOc4Yuo6OKZDICyKOeIU1th9A3QHYsongM0rI7/cuF29j4dl3nmHw
	r7iYgpp1VFoKbI1jMWY11QAQi9uva
X-Received: by 2002:a05:622a:4d0c:b0:51c:dc:18dd with SMTP id d75a77b69052e-5283df0f942mr42057351cf.46.1784826575730;
        Thu, 23 Jul 2026 10:09:35 -0700 (PDT)
X-Received: by 2002:a05:622a:4d0c:b0:51c:dc:18dd with SMTP id d75a77b69052e-5283df0f942mr42056651cf.46.1784826575101;
        Thu, 23 Jul 2026 10:09:35 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:cd9c:212:1357:7832])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a64dsm18472999f8f.1.2026.07.23.10.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:09:34 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v24 00/14] crypto/dmaengine: qce: introduce BAM locking and
 use DMA for register I/O
Date: Thu, 23 Jul 2026 19:09:06 +0200
Message-Id: <20260723-qcom-qce-cmd-descr-v24-0-4f87bb4d9938@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALJKYmoC/3XTS27bMBAG4KsEWlcGZ/juKvcIsuBrEgGx1UiJ0
 cLw3Ts0aphAyYUIiJI+DTk/L9NetqXs08+ny7SV87Iv64lvUP14mtJ7OL2Veck8MaFADSDk/Jn
 WIw9lTsc857KnbU66+AhAxQg/8Ye/tkLL75v68sr378v+tW5/bj85uzp750yPO7tZzCXlnAJKv
 szzx3IK23pYt7epemffGOi6hmfDB00Wo/MW8T8DxANB8F0EBCtEtqhINoesntd9P3x+hw9++Xj
 g4Z8Fd8sIKbBvAVvsAOkclRM4srCxuICuhWxJ70haQlNIjCzZWrZvSbaEN65ERS6poaUaC2XfU
 nW/+GkgxZ2xw/3SD0uN9kvXDrqopQHuQLYjyzQWDtZoqqU0ZUiBYkwjyz4sPcqEZUvLoL1WoKL
 1I8s1Fg7WWJPuPR8rjyYGGtblW6t/aKAmXjhlkXKKpMLAQvGwDPbXiDX32pDh0DuVhB5ZTe4t9
 DOBNfcxoXayAJc3tLC1+n1EvJ1HkcFFtKjMyGpyb7mArlVzD7EIzIUoh14fr9frXy19iEQiBQA
 A
X-Change-ID: 20251103-qcom-qce-cmd-descr-c5e9b11fe609
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=14829;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=nj5m9ijTg01Sv7G5xlvZpgjtZ3XQgHNQrjjJQhNgYzY=;
 b=kA0DAAoBBZ0uy/82hMMByyZiAGpiSrmjAPLE0lKw/U4Qk/m0KseoFHtkyHyNFhPDWZRLtrP1c
 okCMwQAAQoAHRYhBJHlEy3ltUYde6Jl/AWdLsv/NoTDBQJqYkq5AAoJEAWdLsv/NoTDFiAP/if2
 wo8dFpr/Z+xElsDaWUwp9zsrFNLkw09jsnE7Sg19O78hprTmLNpqw/cHT6k7/lamzgR6gj9wFJl
 i0kr8HDStTHdpzg2O5fbJSj6tU7lz9/3seNjOK0ILR63B9VzL/cQ0tJx2o1hLOBXHmedncJEU98
 Lz8Ow2GpKD0IT0dSfYiRWPIboASlgI3tTW10Nlk7pCSs7jG6MEbiOPOKwdfBTs0QCuturkTiAQU
 coPszhXGmAhB70yY819cdqNqWZAJz/Wu7bZSxNQfPlzrVGFyaoNeu+wYu6H1BbaDp5RFthXcnfm
 RDhY7OOCPnneMk2lYs4U8fXqnXZg8R3p35CPEKsOuxP4FYtgeqn+FbhWyps4k08C74InIxfpfc4
 Rz+5U2DpGtmM/hl0wu0UiYQsn0cO2bw3gNCkCT7ag3CMKo4xhATfjlPtVyBSsu6wixKSoHp9yjy
 D7X2ujiIx5orgKLHfaq6r+ACxcpPrGdXql/ANJwCPOKdFCMjPAYytvyRKj3Qw9902BUKVigmhu/
 2piysPI9q1rurtdblW40mzb8vcu3j7+LeCHvkh969CyuG+rjskBL3nbI13OW0pc7vVCouoVY/r8
 WITxyg1BdxcCCXfl31d4+QDISB/QhIU1yVPbgPLfLyjmXwsxEnwOjbWsin1H0UgXzQKISeKZT8y
 x5J5Y
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfX0QpwZ98+8AOQ
 ONoxPUD7pSKEGhHQSb8gOeZhKGNKCezryNAI9vLbaQdvmRj+NcUffZHj8xNe7o0grMLa330WGIX
 Nb3oe8xdzECTaMQep3i77iY8dCpzu52aPvt119s0mcWdZxLwfGOe+wikfGV4Yw9WQ/4l2UyIqr6
 gvdiNXwjvWBeO6t9Dqo+EOfNVIJKtMrXu49VwOaY60pmLDiJHKFL4JII4suxwLZFV7QfoGKWZ6N
 tRoITPySk5o+3K+S9m54IPYpIAlIJIQB0YcO1j50Az20u+W5HdYwrDRv/SFglhjMVo9Ck5kasT3
 so1Kgja40sDA3/+4IQuGeMuMsJ1Zi2ra7VCFduluTe8JotcRK2dLTBZHb2GFnepDR/cPaAN9kFt
 Idl6ed7gB+TGckEi+d6aPEi7uMZDVZ000NW8CVpRNiy9KwLQ+f0wImly/PEXxNj2KC4jhSF/C1W
 9GY5jyJumCciUSrwSiQ==
X-Proofpoint-GUID: 1kPTi0c1hb4NTa4gmll8C54c0gzQE4Dn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfX8yHJpab+SP4O
 K+rycTfs3eypmC8Zfq5JtoLBCX9OFEWjhsUwMQgy35x+V2UZVZRaPDKeOR8lVkalfWi0xv98bLM
 l01qgtmwJ1xH/+gdUey7XmlAchQzwP4=
X-Authority-Analysis: v=2.4 cv=btx8wkai c=1 sm=1 tr=0 ts=6a624ad1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=rl9B2ycCaUGxRu6LYUgA:9 a=AVDerk9WHGFWEF5L:21 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 1kPTi0c1hb4NTa4gmll8C54c0gzQE4Dn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230167

Hi Stephan! I took your proposed approach and modified it somewhat,
thanks! Please take a look at this iteration and - as always - R-b and
T-b tags will be appreciated.

Merging strategy: there are build-time dependencies between the crypto
and DMA patches so the best approach is for Vinod to create an immutable
branch with the DMA part pulled in by the crypto tree.

Currently the QCE crypto driver accesses the crypto engine registers
directly via CPU. Trust Zone may perform crypto operations simultaneously
resulting in a race condition. To remedy that, let's introduce support
for BAM locking/unlocking to the driver. The BAM driver will now wrap
any existing issued descriptor chains with additional descriptors
performing the locking when the client starts the transaction
(dmaengine_issue_pending()). The client wanting to profit from locking
needs to switch to performing register I/O over DMA and communicate the
address to which to perform the dummy writes via a call to
dmaengine_desc_attach_metadata().

In the specific case of the BAM DMA this translates to sending command
descriptors performing dummy writes with the relevant flags set. The BAM
will then lock all other pipes not related to the current pipe group, and
keep handling the current pipe only until it sees the the unlock bit.

In order for the locking to work correctly, we also need to switch to
using DMA for all register I/O.

On top of this, the series contains some additional tweaks and
refactoring.

The goal of this is not to improve the performance but to prepare the
driver for supporting decryption into secure buffers in the future.

Tested with tcrypt.ko, kcapi and cryptsetup.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v24:
- Take the approach suggested by Stephan Gerhold where we don't
  pre-allocate lock/unlock descriptors but write them directly into the
  FIFO as needed
- Verify the peripheral config before setting the bchan->reconfigure
  flag
- Reset scratchpad address if no peripheral config was passed to
  dmaengine_slave_config()
- Verify the size of the peripheral address struct
- Remove unused local variable
- Link to v23: https://patch.msgid.link/20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com

Changes in v23:
- Use the same struct device that was used for mapping the scatter list
  to unmap it
- Change the type of lock_scratchpad_addr to u32 as it's a IP-local
  register offset, not a physical address
- Queue the work to retry the transfer if setting up pipe lock fails
- Fix missing argument in dev_err()
- Fix commit message wording for DMA direction
- Validate DMA direction in bam_slave_config() instead of storing it and
  rechecking later
- Link to v22: https://patch.msgid.link/20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com

Changes in v22:
- Switch back to passing the QCE scratchpad register address to the BAM
  DMA driver using the slave config structure but this time provide a
  dedicated peripheral config structure
- Rename the scratchpad_addr field to lock_scratchpad_addr
- Remove leftover local variables
- Use the BAM struct device for DMA mapping instead of the QCE device
- Use cpu_to_le32() where needed
- Don't silently queue data if setting up the locks failed, defer
  transfer and emit an error message
- Remove redundant is_lock_desc check in bam_start_dma()
- Link to v21: https://patch.msgid.link/20260713-qcom-qce-cmd-descr-v21-0-bc2583e18475@oss.qualcomm.com

Changes in v21:
- Fix a potential race with new descriptors submitted while hardware is
  processing a locked sequence by clearing the bam_locked state right
  after queueing the UNLOCK descriptor
- Link to v20: https://patch.msgid.link/20260629-qcom-qce-cmd-descr-v20-0-56f67da84c05@oss.qualcomm.com

Changes in v20:
- Don't use DMA cookies for LOCK/UNLOCK descriptors as this leads to
  dmaengine state corruption
- Handle re-scheduling of a DMA transaction on full FIFO
- Fix DMA descriptor leak in qce_submit_cmd_desc()
- Link to v19: https://patch.msgid.link/20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a@oss.qualcomm.com

Changes in v19:
- Fix more potential issues in remove path (sashiko)
- Remove unneeded return value check for vchan_tx_prep() as it can never
  fail
- Link to v18: https://patch.msgid.link/20260522-qcom-qce-cmd-descr-v18-0-99103926bafc@oss.qualcomm.com

Changes in v18:
- Free the BAM interrupt before disabling the clock in remove() path too
- convert the size assigned to command descriptors to little endian
- don't pass DMA mapping attributes to dma_map_sg() in bam_dma when
  setting up command descriptors
- Cancel the QCE workqueue *after* any outstanding DMA transfer
  completes
- When mapping the scatterlist for command descriptors: use the actual
  number of mapped segments for dmaengine_prep_slave_sg()
- Drop the leftover read_buf field from struct qce_device
- Unmap command descriptors only after terminating the RX transfer
- Pass the actual size of the metadata struct to
  dmaengine_desc_attach_metadata(), this is not really required for our
  use-case but let's do this for correctness and make sashiko happy
- Drop double assignment of bam_ce_idx in qce_clear_bam_transaction()
- Remove unused QCE_MAX_REG_READ
- Link to v17: https://patch.msgid.link/20260519-qcom-qce-cmd-descr-v17-0-53a595414b79@oss.qualcomm.com

Changes in v17:
- New patch: free the interrupt before disabling the clock in error path
  in probe()
- New patch: cancel the QCE work on device detach
- Hold the channel lock when attaching the metadata
- Reorder the operations in devm_qce_dma_request() to avoid freeing
  memory that may still be used by the DMA channel
- Register algorithms as the last step in QCE's probe() to avoid making
  the resources available to the system before the DMA is fully set up
- Fix error paths in algo request handlers
- Don't pass dmaengine attributes to map_sg_attrs() as it expects
  dma-mapping attribute flags
- Fix a dma mapping leak for command descriptors
- Rebase on top of v7.1-rc4
- Link to v16: https://patch.msgid.link/20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc@oss.qualcomm.com

Changes in v16:
- Fix a reported race between dma_map_sg() called with spinlock taken
  and the corresponding dma_unmap_sg() called without it by moving the
  descriptor locking data into the descriptor struct
- Also queue the TX data descriptors before the command descriptors to
  match what downstream is doing
- Tweak commit messages
- Rebase on top of v7.1-rc1
- Link to v15: https://patch.msgid.link/20260402-qcom-qce-cmd-descr-v15-0-98b5361f7ed7@oss.qualcomm.com

Changes in v15:
- Extend the descriptor metadata struct to also carry the channel's
  transfer direction and stop using dmaengine_slave_config() for that
- Link to v14: https://patch.msgid.link/20260323-qcom-qce-cmd-descr-v14-0-f323af411274@oss.qualcomm.com

Changes in v14:
- Don't return an error to a client which wants to use locking on BAM
  that doesn't support it
- Add a comment describing the DMA descriptor metadata structure
- Fix memory leaks
- Remove leftovers from previous iterations
- Propagate errors from dma_cookie_assign() when setting up lock
  descriptors
- Link to v13: https://patch.msgid.link/20260317-qcom-qce-cmd-descr-v13-0-0968eb4f8c40@oss.qualcomm.com

Changes in v13:
- As part of the DMA changes in the QCE driver: reverse the order of
  queueing the descriptors in the QCE driver: queue command descriptors
  with all the register writes first, followed by all the data descriptors,
  this is in line with the recommandations from the BAM HPG
- Set the NWD (notify-when-done) bit (DMA_PREP_FENCE in dmaengine
  parlance) on the data descriptors to ensure that the UNLOCK descriptor
  will not be processed until after they have been processed by the
  engine. While technically the NWD bit is only needed on the final data
  descriptor, it's hard to tell which one *will* be the last from the
  driver's point-of-view and both the downstream driver as well as
  the Qualcomm TZ against which we want to synchronize sets NWD on every
  data descriptor,
- Revert to creating the LOCK/UNLOCK command descriptor pair in one
  place now that the NWD bit is in place,
- Link to v12: https://patch.msgid.link/20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com

Changes in v12:
- Wait until the transaction is done before queueing the UNLOCK command
  descriptor
- Use descriptor metadata for communicating the scratchpad address to
  the BAM driver
- To that end: reverse the order of the series (first BAM, then QCE) to
  maintain bisectability
- Unmap buffers used for dummy writes after the transaction
- Link to v11: https://patch.msgid.link/20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com

Changes in v11:
- Use new approach, not requiring the client to be involved in locking.
- Add a patch constifying dma_descriptor_metadata_ops
- Rebase on top of v7.0-rc1
- Link to v10: https://lore.kernel.org/r/20251219-qcom-qce-cmd-descr-v10-0-ff7e4bf7dad4@oss.qualcomm.com

Changes in v10:
- Move DESC_FLAG_(UN)LOCK BIT definitions from patch 2 to 3
- Add a patch constifying the dma engine metadata as the first in the
  series
- Use the VERSION register for dummy lock/unlock writes
- Link to v9: https://lore.kernel.org/r/20251128-qcom-qce-cmd-descr-v9-0-9a5f72b89722@linaro.org

Changes in v9:
- Drop the global, generic LOCK/UNLOCK flags and instead use DMA
  descriptor metadata ops to pass BAM-specific information from the QCE
  to the DMA engine
- Link to v8: https://lore.kernel.org/r/20251106-qcom-qce-cmd-descr-v8-0-ecddca23ca26@linaro.org

Changes in v8:
- Rework the command descriptor logic and drop a lot of unneeded code
- Use the physical address for BAM command descriptor access, not the
  mapped DMA address
- Fix the problems with iommu faults on newer platforms
- Generalize the LOCK/UNLOCK flags in dmaengine and reword the docs and
  commit messages
- Make the BAM locking logic stricter in the DMA engine driver
- Add some additional minor QCE driver refactoring changes to the series
- Lots of small reworks and tweaks to rebase on current mainline and fix
  previous issues
- Link to v7: https://lore.kernel.org/all/20250311-qce-cmd-descr-v7-0-db613f5d9c9f@linaro.org/

Changes in v7:
- remove unused code: writing to multiple registers was not used in v6,
  neither were the functions for reading registers over BAM DMA-
- remove
- don't read the SW_VERSION register needlessly in the BAM driver,
  instead: encode the information on whether the IP supports BAM locking
  in device match data
- shrink code where possible with logic modifications (for instance:
  change the implementation of qce_write() instead of replacing it
  everywhere with a new symbol)
- remove duplicated error messages
- rework commit messages
- a lot of shuffling code around for easier review and a more
  streamlined series
- Link to v6: https://lore.kernel.org/all/20250115103004.3350561-1-quic_mdalam@quicinc.com/

Changes in v6:
- change "BAM" to "DMA"
- Ensured this series is compilable with the current Linux-next tip of
  the tree (TOT).

Changes in v5:
- Added DMA_PREP_LOCK and DMA_PREP_UNLOCK flag support in separate patch
- Removed DMA_PREP_LOCK & DMA_PREP_UNLOCK flag
- Added FIELD_GET and GENMASK macro to extract major and minor version

Changes in v4:
- Added feature description and test hardware
  with test command
- Fixed patch version numbering
- Dropped dt-binding patch
- Dropped device tree changes
- Added BAM_SW_VERSION register read
- Handled the error path for the api dma_map_resource()
  in probe
- updated the commit messages for batter redability
- Squash the change where qce_bam_acquire_lock() and
  qce_bam_release_lock() api got introduce to the change where
  the lock/unlock flag get introced
- changed cover letter subject heading to
  "dmaengine: qcom: bam_dma: add cmd descriptor support"
- Added the very initial post for BAM lock/unlock patch link
  as v1 to track this feature

Changes in v3:
- https://lore.kernel.org/lkml/183d4f5e-e00a-8ef6-a589-f5704bc83d4a@quicinc.com/
- Addressed all the comments from v2
- Added the dt-binding
- Fix alignment issue
- Removed type casting from qce_write_reg_dma()
  and qce_read_reg_dma()
- Removed qce_bam_txn = dma->qce_bam_txn; line from
  qce_alloc_bam_txn() api and directly returning
  dma->qce_bam_txn

Changes in v2:
- https://lore.kernel.org/lkml/20231214114239.2635325-1-quic_mdalam@quicinc.com/
- Initial set of patches for cmd descriptor support
- Add client driver to use BAM lock/unlock feature
- Added register read/write via BAM in QCE Crypto driver
  to use BAM lock/unlock feature

---
Bartosz Golaszewski (14):
      dmaengine: constify struct dma_descriptor_metadata_ops
      dmaengine: qcom: bam_dma: free interrupt before the clock in error path
      dmaengine: qcom: bam_dma: convert tasklet to a BH workqueue
      dmaengine: qcom: bam_dma: Extend the driver's device match data
      dmaengine: qcom: bam_dma: Add pipe_lock_supported flag support
      dmaengine: qcom: bam_dma: add support for BAM locking
      crypto: qce - Cancel work on device detach
      crypto: qce - Include algapi.h in the core.h header
      crypto: qce - Remove unused ignore_buf
      crypto: qce - Simplify arguments of devm_qce_dma_request()
      crypto: qce - Use existing devres APIs in devm_qce_dma_request()
      crypto: qce - Map crypto memory for DMA
      crypto: qce - Add BAM DMA support for crypto register I/O
      crypto: qce - Communicate the base physical address to the dmaengine

 drivers/crypto/qce/aead.c        |  10 +-
 drivers/crypto/qce/common.c      |  20 ++--
 drivers/crypto/qce/core.c        |  41 ++++++-
 drivers/crypto/qce/core.h        |   7 ++
 drivers/crypto/qce/dma.c         | 176 ++++++++++++++++++++++++------
 drivers/crypto/qce/dma.h         |  11 +-
 drivers/crypto/qce/sha.c         |  10 +-
 drivers/crypto/qce/skcipher.c    |  10 +-
 drivers/dma/qcom/bam_dma.c       | 227 +++++++++++++++++++++++++++++++--------
 drivers/dma/ti/k3-udma.c         |   2 +-
 drivers/dma/xilinx/xilinx_dma.c  |   2 +-
 include/linux/dma/qcom_bam_dma.h |  13 +++
 include/linux/dmaengine.h        |   2 +-
 13 files changed, 420 insertions(+), 111 deletions(-)
---
base-commit: bf706f42e3a457792f476fac78521b33a66aee74
change-id: 20251103-qcom-qce-cmd-descr-c5e9b11fe609

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

