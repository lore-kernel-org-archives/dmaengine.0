Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793133399;
	b=g13CWmpcpEfMryhZrFYTKcmpvNthB2Cf2n+zeBvy3OoZ21chy3tnAMBLui6H1SYKASvJ
	 QGyY0FMjqJmqGvLt5RzOh+h+39RviWzpDJOLDM9bMSIScElZmSB4stmNUIu0mzwcKa/O7
	 2Gp0rMfXq8d8Blx7Dd2TKrjbkkeawjmDWfoiukUX3JihTpmzpOH+fvZIvhpcuwNe4WQP/
	 /2DbkiZ1ODPUSDIelU518iwI+kVm4n2jhdjiWHWb9aGOmWJIym3yA58G6HC25hCZpGxdY
	 TSzIG7uiSvMXLTBLRZ1ImvAt1HUOc81zUqrRmGlDXwb2LO4yWNZkFhjkPGawOx6px6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793133399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eJungKwd24xGzL5JYcor42TH/xTcUsIKYpqSbdP6+gA=;
	b=RrLLNoSrgQRwqS8Fy3pIDJB1cIpgOWuZu+ayiV2PxCuRXvtPW6MXjyDj6nd5FFUTJDRu
	 Y/YlsMU613gzheegt16J7ZgpR4C36gI43PqyKcffAJ4dWwpLbr1K/XEPfa8dWSJkHeX0j
	 aQSViV9vGDJmzkEEC8BqvqPuQM4NdOMK5Ez1L6FNFZ3w8S1CCwj3Y+AjrjSRuQMAo8AgO
	 F35LgaIYjVxVL+A2zWmW6o4kINPBTYE4Hs6lQ5Q/3z8/hJWncn5y+40nymgFTbGO0YLIu
	 7EavqFdZuGs7X7qhUbbaUWW8SaAm0cO2mnMBMtccUK9ausNA/tIzpKK/2QKbdnOKdng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nullptr.com;
	spf=pass smtp.mailfrom=nullptr.com;
	dkim=pass header.d=nullptr.com header.i=@nullptr.com header.a=rsa-sha256 header.s=google header.b=XF37o1F4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F569606A31A
	for <dmaengine@vger.kernel.org>; Tue, 27 Oct 2026 20:36:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F569606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nullptr.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nullptr.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nullptr.com header.i=@nullptr.com header.a=rsa-sha256 header.s=google header.b=XF37o1F4
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso507064eec.0
        for <dmaengine@vger.kernel.org>; Tue, 27 Oct 2026 13:36:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793133398; cv=none;
        d=google.com; s=arc-20260327;
        b=V520jCvt/foR8a5+WHTXfcv/ArJbY/FsO++SlKGgFgriryxhXvORl2L2MN2pdPAHou
         lg9UpnubC4W+dqrUg4k/wEW8dKi+2hahNX87JAmSxSQbMF17omlKRg8gwmxAF0ZnvebK
         rRECdGZ/qORE0VREH9NT5i5E+dxOGP9e2vBX+EDw0H3qCL8NR5NSyWeLyuxhfZiL4YPg
         i88HuAEtId6PGDrMtpzpYIkKwJB83+nZnCcczsyMgrT2RRzo8CixVO8VsqPK6OZWTbsR
         YSi1MUpq6rEqxbPc++RkyBwgk17v5i1BL/K5AZAglIUt910CPDKOObkLmOrcAf7mz9wM
         CuYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eJungKwd24xGzL5JYcor42TH/xTcUsIKYpqSbdP6+gA=;
        fh=yMDDPsoNslrWZpRzeVDLvO+bTTu9Mc84hLcEUYOqU8s=;
        b=hfg2rYlKdaEI7MPnr9cP4OXxNs3KqZFiGQuIVHabRb34pOqlQzF5DApNCmwEgE3/cv
         vv7w7zk7BOaJ6+lKelTQoEqwq1tju/yqNbomMtTGv+XzXaL5niMfDsaUzgTrxWtUxP6p
         qoNouJNXWng3x1DOO+cqbyQdFzg1Y5KT5Sj9imO848QoFjcqtl6Wx3cJqejOK6vANwl+
         c0VWk2xP4NKh2l1XeDlvLTiHR6427IVrQirrDDToGzqUpodiw5YKY5DTXjoimBas71Ea
         nFnvOnbtRd4Oob+5kGgHlQaiOGOntLQzdYxQMhdzMk9OgK5Tq4Dk6MCPf4cZ8++balEh
         ngNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nullptr.com; s=google; t=1793133398; x=1793738198; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eJungKwd24xGzL5JYcor42TH/xTcUsIKYpqSbdP6+gA=;
        b=XF37o1F4Yl22QTQkqyOw0BCFOpbxrXxBKGoWPBi77Y2u8CtYc+P1QCvBeSxf47fdAP
         29tRm+6w/glVebXC+gX6d+yM5K+kw+hekrWg2R9pV6Pnc5doMduUSAWT60BwjgTL6zkf
         cyu2yiN+Xo+DaEDEC7O8dkvcfp1Uz0r6PXJPXqFUIogytB6Nove67Ywco+YMSI2sz9Xv
         cyKVZrMMapJcAUfwOPJy3u7xxISTvjh5qHD2iSTmAS1In2clRR6ORix/Nqf3RvEZ56Ck
         Wnt2J0Gu/z3/EEUHRh+nWpikqGRBqshdDL0BkXrHrbpm9sj58D0t7MtpDqIBGa52P/vx
         M6EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793133398; x=1793738198;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eJungKwd24xGzL5JYcor42TH/xTcUsIKYpqSbdP6+gA=;
        b=DJlg/1Y68K7Ppw4iBMeeDnrlSuJakfQp28HOslPwWBfQcaXPFHAnQr6pUFzVldr0JI
         v0MT3PN0VxBp+D7x3AE22mhpOyGwybqIDcRnv/Lpz5xINnBT/QL/aO7CU6SFtiO2yrAx
         1ohZQ2qagK+7e7xwm84LvoxRRtiNNXeVozvngYH3KhOOU8qsGq06A6h5dDrg34ODAu0c
         Sqpn2dbZw/4Tc9MeLJyjW/J1jxSRbt7+vKFBacOYTfvl9ZysvOIWSwex5yAa74Z4/ob6
         bJqf+W2+gSLz3guLp47zxo8y581Ru5WvH+bbzAEWgkAICkLf2oqXdcmvR1mmhQz+cjWh
         gAJg==
X-Forwarded-Encrypted: i=1; AKwUvBwfbqFZzxWo0a+Xl3yVm8/flYhi+A7pdsooU5aXNNa3qHIhH3Q232HybnQ7xV9nOy31XLJB1Z+r2Ik=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/JMY79KN2Z7ymHBsc4XkaOf/4lRWBd+4AEHIjt/Eek1648Q6W
	6dMBk8PxUpjEYa75B1mA9JczME3WuAoGItryStHnVDIqrPABaoYiTXpXj3b0b479EoQfRuQ7FPI
	7iEl5ppwHKyTJQpUMcbJDM8YFAKQt6sNRpzYDsNA3Ag==
X-Gm-Gg: AYBFou2Sf7ywQswwRHolX2OK+6UjL/gYeGjYRNMwuGZWYVsSEpO4mIMaH8L+GPj1KBJ
	jfdqK4YPrIDTq6Ty8DFkq2bjo9VM3Qj/4Fx1oWETX9N0vJQO0EEXJwsnuYT+eeCXi/DgQaY2boE
	2uyfnk/2gjTcR+aPww3lejKEK8wrxbZUbWNiVLJ0QoZ8CUrTHLU/HKImUBLiYQGwtqCZynxcVLy
	KuqmDnOmqOuaMXgOG6uUzNeWmGEQChE0kAh6xOO1ydlGcy1aN+IFvV/EmCnw3PR1B280s5B0PGm
	jS9m4P0pczYoN7+6Q2SfLtjS099ijCcpuuk904DJMGzkOKbCrcfUeubG0O7Oz1fSWvqD4fuzOp3
	mcDUdPexK+zHIhpZhhsu7qkot+Mfb+jrr9G0kCmc1SjqIDWFnkgpPUHbzl9Tzdxgi7TXq+NnRfJ
	aQR/f95NtM7v192KiN1kckKVHkmExpFQJlCUQBJ+T6aR/YQE+8ArwcD2I=
X-Received: by 2002:a05:693c:821b:b0:36a:1294:59e0 with SMTP id
 5a478bee46e88-36a20179d20mr630828eec.24.1793133398014; Tue, 27 Oct 2026
 13:36:38 -0700 (PDT)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022-xilinx-dma-work-v1-0-20faea2e7a80@nullptr.com>
 <20261022-xilinx-dma-work-v1-4-20faea2e7a80@nullptr.com> <auD5_fHykXpkQ8ns@lizhi-Precision-Tower-5810>
In-Reply-To: <auD5_fHykXpkQ8ns@lizhi-Precision-Tower-5810>
From: "Jeff C. Jensen" <kernel@nullptr.com>
Date: Tue, 27 Oct 2026 13:36:27 -0700
X-Gm-Features: AclHuK_MdLe_77m-KmkFSnccE3-4pezFMsWPScpQmmJScc5U5CiCCI34Cd6wgxQ
Message-ID: <CAHnw2UkB_KTh3c816SUUgaH=SenFKOpYwvaMvowzi-O5oFmCyg@mail.gmail.com>
Subject: Re: [PATCH 4/5] dmaengine: xilinx_dma: Withhold an AXI DMA engine
 whose reset did not complete
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org, 
	Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Suraj Gupta <suraj.gupta2@amd.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, 
	Alex Bereza <alex@bereza.email>, Folker Schwesinger <dev@folker-schwesinger.de>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

In theory. I haven't seen a reset time out on our hardware. Every failed
reset in my testing was injected with fail_function, as the cover letter
notes.

PG021 describes the soft reset as graceful: "Pending commands/transfers
are flushed or completed", and the Reset bit reads 1 while the reset is
in progress. My reading is that a transfer that must complete needs the
memory side to respond, so a stalled interconnect or memory port would
keep the reset in progress. The driver already allows for that, since
xilinx_dma_reset() polls the Reset bit with a timeout and returns an
error. It just doesn't act on the error: xilinx_dma_terminate_all()
frees the descriptors and returns 0 regardless, so if the engine is
still fetching, the next transaction reuses segments the engine owns.

Patch 4 may be more than this series should carry as a fix. One option
is to drop it from the series and post it with patch 5 as a two-patch
RFC, scoping failed resets out of this series.

-Jeff

On Tue, Oct 27, 2026 at 12:22=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com> wr=
ote:
>
> On Thu, Oct 22, 2026 at 03:11:33PM -0700, Jeff C. Jensen wrote:
> > When xilinx_dma_chan_reset() times out, all the driver knows is that it
>
> Does this real happen? or just in theory
>
> Frank
>
