Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794272626;
	b=3XCj/zRESwA0wABepl+d4PlGuwDtpubOpyowVz5LpCXdKlJTZ6vJ7mTRGt3chgQv430Z
	 GsHJ9uV084aP2IDsLWgiokJC3gOCT9z9yypap7etElRBOFFEKQB8DxFO7l7qfVRtjtIZE
	 ymusmhkLtHmhgHfDs3gc5yZViOTI9POfDud/1MVR90s8hfQHRsHSGaqMu2irbiE2viwTr
	 Wz+smMRJ8GZvBBSCN+BYBzh61CmpZNvudFh1jlPHDR9HAowkmqQg9cYt1q03PFq15WpyH
	 Irrwe5RULG5YBNW9sX4Ibm97eyPU2ltwbnvrvm/AsSrDpg8tYSXTArEtvjcLWccdogg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794272626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:In-Reply-To:References:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=K+WfmWLpflRA+bUwC4gEr75YY4Ckyb5jqXk5SR8iLBA=;
	b=GC012tv+nYGGRJ7eb0L5kFxk1tClPEVmaxmACSIe6CTp3XF23+sPRbDyCoe4PZNW51oT
	 JR9OAJtc/sPLPRZnha4skbjlFFEfsE5w14dMPjfNe3779gCVVZas4FgCMn0ev0qBoROMF
	 oh1OnBRruJLNawEcm13y8RVWboV0mfXwRbnd9/lE9Mp+ZlB9syY8AYP8X3EPl4zT2CKZr
	 bYeGXhYro7DslpYDDWlJDVJRgaADBsDt0Sj9m37uBN/57ASviBGDdQfO9ASA153fJP9P9
	 +2zYsazJf7v1onzN7+5b9FFOOWskhTZWRs69yYcuOkUm4MyaxQ6fANFIEe4kNRLDfEQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TFhBDZen;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912AA606A31C
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 01:03:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 912AA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TFhBDZen
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c468bd799ecso211916266b.1
        for <dmaengine@vger.kernel.org>; Mon, 09 Nov 2026 17:03:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794272624; cv=none;
        d=google.com; s=arc-20260327;
        b=NLwWzJAG6WTOxj72M10sA1FaJMKUxNyBc2KGk8S83JaEyuEjqJOAJ4/hIux6zBNuIJ
         x5P969t7T2qMQs2fNQ/DJvhUQ+5yqI01SpbG27TLne22aDiIV2YkTpMejWxjOaYzIwtg
         Zdl0A6IVQbNiSrD5OQQQCY1cg62cSx17+iX4fqOhB+rxMBzJ47Ru3LB+fTodgsW3wU/Z
         RmnjtJQNh4tiNOoBdr8R5EU53uWmSiCt3fCcebqWehAd3YCvJj/uzAom1haaBkZBoCTT
         J7kJXjMNm5E0g1Os8WN3IwpmDTYOteUJAzdfIvvkarQRH1uAEypwUAvpXEOw8smsjqfN
         9Pew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=K+WfmWLpflRA+bUwC4gEr75YY4Ckyb5jqXk5SR8iLBA=;
        fh=hPcsY1MhZJ1QyVti4vOYZwazg9Zc6SLYHfyasCbcMlY=;
        b=YRGj/trInLxfE/7G1+7kphE2S6FNagkTCfVYYMr+rD9RL2eUGNflF4eK05dgFch1Bs
         Spgztpm39FjWa8oJyzVOfHCsKwBFADt1KOC1GARKKsaKSy/8yyHE2YOC1qUjJbJ6evE6
         LJLiLOGy7Aq/alEWhErk5Bpz4ZL6jo2YV7o+l/E5O5D8FK5z8CoJfR/YhaKFbG2xgtKk
         nPyHAlyfn6wwk62NUGiFjm/4DBy6U1MlsMWPACF9TsaTvBiflbN5rkp34t5a66SZTWva
         ysXFpmCrDJPEhHg8x4dWkgf31pE4x3TFNP82IX9wi6z2uruDpSSa9D0wr9LbTBHGCZn1
         iWIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794272624; x=1794877424; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K+WfmWLpflRA+bUwC4gEr75YY4Ckyb5jqXk5SR8iLBA=;
        b=TFhBDZenFN45JlhIEeSGBEeQfWUOkKjAKUvTUvvY6zeYFJQ20XCoSxzTXgWCefeyV4
         bO33UG7WYxjqgtSXChX3H/6yyoNU/kUlWPRsetsllVbVbhYuy7IenwrRes5+SOvkyVGt
         66KWKf/w6vx8Hsf7xPEbZ3nWXCbiO++juGnIlCPnoYTa69GyItCinuGANT+pkfyE1EQV
         PGdtj1/68sK5Qwz6EjMGqWWIpAItMN2xwWzXunJty2v9HRr9hvlAANNt5ottDFVt9/EG
         t0MxT8SCeJE82/hQAx5iMOSZ9bsN1p48iHsCSxnvdOMtcE1zTqVQiA9u8KhleNp9onBa
         LEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794272624; x=1794877424;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K+WfmWLpflRA+bUwC4gEr75YY4Ckyb5jqXk5SR8iLBA=;
        b=CPlPlOPBxakAGPLi4cNrgf4RHZ1gHDdfRP1BHwEIsevYPqC+4+egbnXHZ2vouhWmVk
         nfuxzOpHrd6/IvPffJw/xO0qcESIAtFjLM1yuk1vIgnsivwijm6lVO9OTfTFSY8dN2vL
         V4fpirfzkWzkVCAmVbuLpUZq6bceBAoApXT+mL8m1dpjO5FC1b9d7U3jMTuBUtyo+0/A
         fDiOXOF+7rMjfH4Vr2pG6pmb1NFqmOk6c61h/EF1CUM7pnx1ixyYX7vYTUNTrFhHQH6v
         2NJM74ejfkNy/4zItj7K2ZjmfFVur90KNkk5jiZzF4gWpbd/L51XTLxUXNS/8q84uYKT
         0cwA==
X-Forwarded-Encrypted: i=1; AL+hErGhzF9y9W55A+s/pRBa54QLl9x8Ifm4K6E5VIgKqZhXXlg1PXf2vJbnZV8hancbkW8xlCc3H/dfUvk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Dn6Cw1YogSDvP2OZRjJoKtVyfTEy6uD5jD00NIvHsH5QAxlz3
	ctK8IjkB7LFSxtQ0lIID/bNPC1v+jJD+0w8qbxPY2U3WdUxnBn0/tIjEEch4rAa/4Sxvy8JK/0s
	jF4rhjJ7OQ9lr8uZgOkc5h8tYwqSDkg==
X-Gm-Gg: AYBFou0nDktKWf7EpHvkjN9b3+mHA8f8rzbyRDr2nBGjkuSiZbXunWQEsQsbLFouOFI
	wWioGWPAZC37uT0EvMHzo7/FJshgb7C/UwQhHa8AaxgEcjfmQk4ywERjBR3AWp/GL+grZPS2O6/
	jViXrpljhsKaXQ5yw5XRdhdtwtcsWP9cfu1p9VX2A3YbiaBbaIWo38s8YppaH975jzf1QM1pvkW
	L3mcsFcz5rWof1xaOIfBtUJRw2wEfUJqclnhcV1NBSFM47DC8jVpkZGAc8EYHvtg2mn28VrAvvU
	/q0yWLfcMbrEewhrZFBfJ0jaZXqqTSr56lsGLvZBxom2BL7er6dJ6Obs1svdrE8RoUAMIkc+PSH
	YsfJ9aWyb2jaURB8Y4tlg/oFDH9Oo6FUiwBTuJvggBqmrW9z2w6DRbHMjbF8iCCLnoNiDKjlamH
	I32cRfj5U8G1prgtfEoeRWmFTKfkURe+ZnM/ix8nW7dv8k
X-Received: by 2002:a17:906:2f88:b0:c4d:4d5b:4bd6 with SMTP id
 a640c23a62f3a-c5049588c43mr49781366b.41.1794272623674; Mon, 09 Nov 2026
 17:03:43 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 9 Nov 2026 19:03:42 -0600
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Myeonghun Pak <mhun512@gmail.com>
In-Reply-To: <CAGEsz8ENCW++SA9cdh5=2EVmto=2-2axzTwuNhaKv+xW02Vvtg@mail.gmail.com>
References: <CAGEsz8ENCW++SA9cdh5=2EVmto=2-2axzTwuNhaKv+xW02Vvtg@mail.gmail.com>
Date: Mon, 9 Nov 2026 19:03:42 -0600
X-Gm-Features: AclHuK-OJaw2qupbzmzX6Mid4lqVpd56r616Z45mPkUj2w_nmX7EGPR89o8V2q8
Message-ID: <CAGEsz8Gj01qFUzbEqymn8oPM6puJkaJoD6QLGabFnG9kzMYF=g@mail.gmail.com>
Subject: [PATCH v2 1/2] dmaengine: stm32-dma3: unregister the OF DMA provider
 on removal
To: amelie.delaunay@foss.st.com, vkoul@kernel.org, dmaengine@vger.kernel.org
Cc: Frank.Li@kernel.org, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	ae878000@gmail.com
Content-Type: text/plain; charset="UTF-8"

Probe registers an OF DMA controller, but remove does not unregister it.
The OF DMA helpers retain the driver's data pointer after managed cleanup
frees it, leaving a stale provider entry for subsequent channel requests.

Unregister the OF DMA controller before tearing down the device resources.
There are no fallible operations after its registration in probe, so no
matching probe error path is needed.

Fixes: f561ec8b2b33 ("dmaengine: Add STM32 DMA3 support")

Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
No hardware runtime testing.

diff --git a/drivers/dma/stm32/stm32-dma3.c b/drivers/dma/stm32/stm32-dma3.c
--- a/drivers/dma/stm32/stm32-dma3.c
+++ b/drivers/dma/stm32/stm32-dma3.c
@@ -1921,6 +1921,7 @@

 static void stm32_dma3_remove(struct platform_device *pdev)
 {
+	of_dma_controller_free(pdev->dev.of_node);
 	pm_runtime_disable(&pdev->dev);
 }



On Tue, 10 Nov 2026 00:42:55 +0000, mhun512@gmail.com wrote:
> Split OF provider teardown from the managed clock cleanup requested in the
> review of the original patch. Patch 1 unregisters the provider on removal;
> patch 2 returns the active clock reference after managed DMA/IRQ teardown.
>
> Keep the existing remove-time runtime PM disable barrier. Check initial PM
> activation failure, and let devres handle later probe failures. Remove the
> manual IRQ-free loop from the original submission.
>
> No hardware runtime testing.
