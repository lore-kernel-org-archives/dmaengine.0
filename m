Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793230701;
	b=PdlNM4nBolU/BYvQPkRA1SQzjmQKtnVGYgYPirxYx3GdNvvOXzXle+ccCxyijodCdq1l
	 eBoLdfyfVyP7zFtNN6EhCa6yGk/V6W5nwITDi7nUmMlzYDemExCtoaAoHfl7b+CaZWCHB
	 cERhNKikVwuKhtjh4drIgIo7KM0rM+ysT1pGCDYbk8fq7lV1EM0lsxq09JXWLg1mdvATU
	 sMAOnwBifi8YVVqQKKUBVKuimQdzPT3OdvtrL5TdZW7i6Bzf1QYRYT7+qlmvPkUro+Vun
	 oc0wDGQ8dIQxLEhZgkUzifFZ7iPOyU51II2GwXMUvde7PPVlvBCSP+VMCnJyU8j6C9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793230701;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BwnJftUwj+AATA9qklYrAxD78ahkF2IuNib+vGAuNWk=;
	b=cOwSBbbXw1YUP7gftf/8uqazbYSWe/fvsgNdLi1yPcEUxYhc+LSgBH4ijk+n73FynOfZ
	 MZGneyCre58we6D4VM2OX8nU70YYM5JIjFXr/gfDhOew0Xk23NVlx3kYJDVank78r3TbW
	 phDc423YRidG5OAMLqH4854EVqRw8JA6dzWtZGt9j82LB4d6mV1dJrM91ja1EB3Lex+d1
	 eigIfDQ2fbRLyFsxzg5RXWmrSjH4TD98rSKS8Li/PM1zsbTd0VKOBV7pyvhv+K53gkYNJ
	 7e69N6vgbWqRko1HkD5jXue3dlizOwgkfZPLcfXAKCpCg6Vdjt1Jv05cwnPuU0PLvow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nullptr.com;
	spf=pass smtp.mailfrom=nullptr.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C785606A31C
	for <dmaengine@vger.kernel.org>; Wed, 28 Oct 2026 23:38:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C785606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nullptr.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nullptr.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b10d24345dso15191127b3.3
        for <dmaengine@vger.kernel.org>; Wed, 28 Oct 2026 16:38:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793230691; cv=none;
        d=google.com; s=arc-20260327;
        b=K53+150rSRnJYgYbv5IUVuel+Y952Ts9N8gUUufaZcbigWjLidl0wVaM/m2sEHtc5i
         LDB0pzB31mxOT12njQ50mqlDfXjwU+gtex/R4YBwngf88Ta9866gyxR1LqHHimQqAQ2Q
         3FpLXmYu9XTS1nKLrChp5JyEsP+bxOvkRp2TqQxx4N0MBo94hcQLbE21ad5H659jYkdp
         CyBl57kbUkMGx0hKo+prm45j8WFON/u2Jr8iqjvKn3ss1OK/kWTXcJXd1Aup6vM8g1pc
         JX944pB2Df+xQ6MGabIsT+m+uMvrb9XdDzDIj6L3wnMRH2YKdC2o7uhd6Lii6cvvMGt7
         CuXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BwnJftUwj+AATA9qklYrAxD78ahkF2IuNib+vGAuNWk=;
        fh=obdFqePYz6SyQSANaHWJrZm1BoLZWyUzOVNhOymkmAc=;
        b=AP61iFCPPN1xerMcebgiFcAVNJdtTktVtm5d0s3H1VhowT0lwQMAA8mfKOjkLu72Tl
         wvlD3ns5VyDnKdL4CdTihHeweTDpfdZYPwjWV7QFEZDuwl5+4B7XgedPz6Gv2wQR4hsF
         mMk2O/PLGbp9gs2pZscgg5ppMqzTxOhUvs+s6eay8p6S/mAa6TU3bi+wyon2Iu24/lW1
         AtOj6UbCXDm2ggAk2a4yzHHdKkpzfpJRtGdbSkbV12u+LZlTLpogsCQM7MbaRyI7msKq
         8jZtmtOYyCRnpofvWrFNN6k+9zR892OFOpCs1FsZYKU6Q66oveAWuTl3tFwo9SmsGoQE
         CuFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nullptr.com; s=google; t=1793230691; x=1793835491; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BwnJftUwj+AATA9qklYrAxD78ahkF2IuNib+vGAuNWk=;
        b=EybuO5PsCdtZBlXFtNBHcCMOqDiSJOQzE2/e1eChgMMX/p4gC2s5ERF/SekqQcwU5L
         8MMrtOnx6JSto1t4eCs748AzQuyxhXk8Hyb88kcp/ZOqiC6IZAClqDr+aZUuTyYmBpIK
         +BqhUm/rE5atw0n9GMRFHQBEeK4PSSUg9FQ8EgAIfJZ/DKnu5+faT4XO/j8ZC1Jrv+cs
         05xFinPkiI0uY0HNn19PXHVVv8C/b28LU2X0T6OwtYtai1zrsLX351sdJtoFYEs2cS9m
         3WKqyoXpz6dSRoGXWuSX9yJ3Xk1gDi43U41lPFA4osGc8Yfz1zmczSbmnPy+bWot3VTt
         iWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793230691; x=1793835491;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BwnJftUwj+AATA9qklYrAxD78ahkF2IuNib+vGAuNWk=;
        b=YTfqD+XyLxUR7lh1YTMAyvToUP5MBJJvBB+le8/pP0Xq4sXZvVOX6+CtGrGHoO5SaB
         426wCEGRkDOvURxpsu+WIZJFhnpJNhvv+RJdgMdRW+DP9UqOmuI1iVEP4HnFVEMtImyj
         De3VuuLYsJIEY43sjBa8ftsOhOy093DJFvH7DrWfKqDHocqvd734ODSbmauVPrtBzxLP
         4lQIDYJKivZkCmFdEg5v2Re9sEWEuizuUf7K8XJXiL8ny91GsptlWCNrEisfydqCju2d
         t/EBtzLMXAAJJaR+HNzOckdr5gRzk2xQCEQUNLfC0YYrxHKcXg96CF7Nhk+1kXn5o+3w
         Hpwg==
X-Forwarded-Encrypted: i=1; AKwUvBxDCtxvbqk6UkJupAJP5oogzepgq6Z0IUShwnasrp1atpnZB2I8V+Mmens2M2YNTnvogyCtZyBaYWU=@vger.kernel.org
X-Gm-Message-State: AFq9FYI66OrlovPCfq4YK1YiT8HUBSkp4aUEFYZfEzI5HbDgYVKhLyw4
	7b/wK4eufF9/2p4GRGzDUdXOt3ihyfRs3RTUonrot1yY1vnlF8aPwk4pvKTDRj7rz9QNnRSQ/lP
	IdFneaTCqPwIRjnwO4xMige6Zav0gmG0TnKG5bGgbCA==
X-Gm-Gg: AYBFou3Z75y7uAlkrLNyfGB/embbWN5FEPcoCZsIr08EFqYM8iKOk5lTBSo5CceCYH0
	XHeIwBL00nTuIlLwhbdkSc3dfmrphLBx5Mnikgz/79NqDebM6xDLzKF0Nbczes7k0+/x9hQtesD
	Nw5GJAHukjoPNfvEcagT2uKCc/ryg7g6JIkh1vTmNINDdThLLFjPJqD4wdjxeUgTwtwPnCOm/Tn
	i7bzIC5YH21bYYiTKiZLCQQYQ+yQeZWWiof9CQ7D/SIcz8n9RMSS6EY1tYxYcff2T5K/rQgS4jV
	Tala5WprhpwrJXoZ3gUi5q1IcK06W8/4nHF5Xh4XGZKtUzegcHivl7uhgGxxT53F9NHr72cokOw
	p/s/fyAR0UAELhFJOJz/QSFrpHjXHgIWcPtVOy6u6XRJGdNzXjM6j4z5IU2jkI08oExbWYz7eKz
	LcZy7IbNWjrVE3+2hd6hBTMtHfbMTXOQA21gf9GUkA0S5hxARHJ1MNz/U=
X-Received: by 2002:a05:690c:38b:b0:8ab:37e5:6678 with SMTP id
 00721157ae682-8b1b5d394a6mr28742787b3.44.1793230691387; Wed, 28 Oct 2026
 16:38:11 -0700 (PDT)
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
 <CAHnw2UkB_KTh3c816SUUgaH=SenFKOpYwvaMvowzi-O5oFmCyg@mail.gmail.com> <auIR2GFWZHUP5vzs@SMW015318>
In-Reply-To: <auIR2GFWZHUP5vzs@SMW015318>
From: "Jeff C. Jensen" <kernel@nullptr.com>
Date: Wed, 28 Oct 2026 16:38:00 -0700
X-Gm-Features: AclHuK-LKjsKCaobPjRchQyPcT15lMhGBWVE2x98cOvF9GEVC10J-zU2k9Et8_w
Message-ID: <CAHnw2UkoFcTHs7nXBBFVEZpyf8BCTs9tpkSmj5RXCsSoaQmK4w@mail.gmail.com>
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

That makes sense. Given the cause is likely a hardware fault, and
that a timeout is generally a sufficient and common recovery, I'll
drop patch 4 from the series in v2.

On Wed, Oct 28, 2026 at 8:16=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> On Tue, Oct 27, 2026 at 01:36:27PM -0700, Jeff C. Jensen wrote:
> > In theory. I haven't seen a reset time out on our hardware. Every faile=
d
> > reset in my testing was injected with fail_function, as the cover lette=
r
> > notes.
> >
> > PG021 describes the soft reset as graceful: "Pending commands/transfers
> > are flushed or completed", and the Reset bit reads 1 while the reset is
> > in progress. My reading is that a transfer that must complete needs the
> > memory side to respond, so a stalled interconnect or memory port would
> > keep the reset in progress. The driver already allows for that, since
> > xilinx_dma_reset() polls the Reset bit with a timeout and returns an
> > error. It just doesn't act on the error: xilinx_dma_terminate_all()
> > frees the descriptors and returns 0 regardless, so if the engine is
> > still fetching, the next transaction reuses segments the engine owns.
> >
> > Patch 4 may be more than this series should carry as a fix. One option
> > is to drop it from the series and post it with patch 5 as a two-patch
> > RFC, scoping failed resets out of this series.
>
> Yes, reset timeout is most likely Triple fault. If timeout happen, most
> likely hardware fault and can't recover at all.
>
> We generally choose timeout value is much bigger than enough.
>
> Frank
>
> >
> > -Jeff
> >
> > On Tue, Oct 27, 2026 at 12:22=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com=
> wrote:
> > >
> > > On Thu, Oct 22, 2026 at 03:11:33PM -0700, Jeff C. Jensen wrote:
> > > > When xilinx_dma_chan_reset() times out, all the driver knows is tha=
t it
> > >
> > > Does this real happen? or just in theory
> > >
> > > Frank
> > >
