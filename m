Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792792675;
	b=pYnpVQT6kgfH86mjB8NQmbPUr6bie56k1NH2XZ3jms3VIbnruMFx38Yn4dbECxjsHe4w
	 qVKlhVc8VA2vcJQ87sQOpgI17szN471eeAiSyn/GN+5zus+Ntgb9vwbJ8DIkX15pqZs3p
	 Ds+dl1262sPmjtJlEeebV1PjNJ74yrF7Q6AOcP0N9aPYJSDy/V1JgHomTXfvIISlOgSVn
	 YJBeTQwr9Dqmj5Lxvsfv1kA+XrVgjHF5odrRE7J+Yrr1nztw5qm77y7EUpUKGtUCHVhIt
	 vtslcp+Zex3F5fBtwbDyTQcWhTvbZaVK1TdGGCwgOSPb/PUWdhfYf9H5QjNL+yUMdAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792792675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=u2tjAoav1AcKC/5Jjeoiq37UKpYVotTU7YdVuht/Pmc=;
	b=QsSPOEf+lgVgbRcTw5JegXWwsTt7l+beH89y7xTWuxhQN0rJ31h32hyaIkZuHA+priE1
	 pUhcAnzMCCqqFrB84IzwJXRvN0FJih5r4xY5lanL6DFSxTXgJKvoZ3nRrhBIV+oJ3fHut
	 xeKrli8Wn6Iu0gYwreMufP/OEX3uQbYWQ01wOzc71IV5cGUwfBOFCiibIJwmi6DfafUHp
	 AE6olC67TO/5lsWQ41OC6Rx4Z/j4ojnQfZP81BXKQUHvInzA08XgGmf8szkTB/GKHhHEr
	 8sSrRYiTvQRDtKkrVM4oar6PukskNTb+xu+Pi5kcomnM3PlzL5MBYuliVYSxPYdErWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XFtMKkx9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.51
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FD1606A31B
	for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 21:57:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53FD1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XFtMKkx9
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9906034086cso574142241.1
        for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 14:57:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792792674; cv=none;
        d=google.com; s=arc-20260327;
        b=VIm/EEjcE/+n+LNX7G3o31W1C1aV2YvAAhQ8ijR4eF89umvHtemn/7jYhpfiNt2jjw
         EviVchJAObg3jNAmGSttjBY22UnybUTp6hQ8M8wB2AiW0ABPN4CH1PPsf5iKlUmF1nEl
         EybYMDbcAkBbgFW4msOqmjp0JKTaGl2JE5cSdtJu5QZhXlNC2u9NQLX7ZVSbkiq8jPja
         /mEmUaSFz4Yk5cReobec8Mj6MgVDmW3WS6ttHwD+/va3oPxqqvYCLYnsinx7/N8ZqbdJ
         NPVJcNCYYU5/cIU3RR0SsTRB7Lw5TvAcsnTiiays3sxmuTvlE293ezyMl+dCCeJTKc4C
         bT3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u2tjAoav1AcKC/5Jjeoiq37UKpYVotTU7YdVuht/Pmc=;
        fh=tnEiCNVGuSJkLVHkBocFroKqF0MuB2CPwX3XDqgKMn8=;
        b=DHf0vhYt/Mbw42E3JmJURuLYMrzpkuMgQkSHfJQ2kIkWG2AhWYwG8XNv54fDsTH8Cj
         Eadyfx1tcqwLCHAuEjoCgNS9sfcEOIW/o0lz/xZmkIaxZWBKCPSYHnf0ua8D48g+d4/K
         yxb/mjzS+nUUkMjfa13LoRIbXZmJ0eEX+gQGCbvAqF8WU0j3Fz1WLWgU7MFpCAGvGnjx
         OD23rOL8666xQhTEyT4z1sWoBEGW3aA35anad5SKr4urjBOIlbcUzDDIO+4thokXjh9J
         e5Ed1GBR5vIi8kl7ILyOe92cSqocebZOM6ZzarPJeLflOlgLDAi5IXVQW5eTSx33hODn
         rkiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792792674; x=1793397474; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u2tjAoav1AcKC/5Jjeoiq37UKpYVotTU7YdVuht/Pmc=;
        b=XFtMKkx9QqX9D1aSU01YG7tNZeRvK2FeEy6LvpBPXXzRUvJDuCW+EMYco6ZQzuD5eG
         TWRkofZfilD3hWzcKKTeNQNH8A/gbixoiZso6lZRKCq6ZKUIuILg4c8Q9JyYq8vAE+cn
         9LMj48JxnjptTOys/QGunywKXgDo7Da9bCrdQ4ivIOzSkKXmBnIQoCSjDhnnhExzDv6R
         tVxXZyeko5KE0SNLaHu5au5/3wwL6L5QZ39usbKWhGhif0dWDL2b3OlWq/1DfuTuF8ec
         KiA0kmU+8DAvPRuUeVeYoD0oLOpibCP079Hahb5V/QOlV809wX/n/pYSJAiJ8grlVZuA
         vvXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792792674; x=1793397474;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u2tjAoav1AcKC/5Jjeoiq37UKpYVotTU7YdVuht/Pmc=;
        b=Ayz2BcQQ3CRkIQeecs1dCHSEUqxAmieB51oMGzOGj43/sSDZwbYrm3s3mOQ6lvjFeJ
         etRTBTiwwLqj8TIOaKYuazjGPHZCMOQ299hciQfVvpAh5PjaTnEQI8Tckm7aFdF0IyKN
         5wtIGAr8k1zuI3WZpE4b1sARZLWmtWhSxptSX54em1ewAlToK9M2+T8Ur25uBOyUFGey
         WUyOH0f6J1Pr03EQC2Lw8e5hZ/VxJU69JUbT1qW530Vo1F5GPrycqMq4H8dniNpxl58s
         dwk9Gt/sZYYYtC3ZDHFI6JDvU+8cbd6St5NpuUyWPnreT3+t3CdKDEEUrkg1W6px8/hJ
         AKxg==
X-Forwarded-Encrypted: i=1; AKwUvBytKwUT9UzGzOL4RqTJ7VyolHyZZ0+lOOm0YGLFXvO9bxtRMFZLmz8u/jk9PGjmax8eiwz3TZAvpSs=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5sEGtPTmrn5qEeHAOUj/pvh9VB+4y38wpNzfkcLr4udCweFwd
	3yLNS9S1WCT8LRUzZbbJzP49HuM3TBBMMx0S4ZRsB0BQjgEJf9Z4HLyd7v31lVJjYmLn2IzMsFf
	3fybWRf4Bj9/gJ41Se3tSL0vfMQK84d0=
X-Gm-Gg: AYBFou0OA1vp1knhSxFCOvxq300SmjD/+ZvuLpSzBJpzN4lizfohcuzO3+0QMBrykNN
	RLRJ3H79LdnspL9/1Sl+yCCmhh/eiFCzRdnbNE/JNaONtvIci6BjEnhOnTQrMm2z/JR9k3NESz1
	Ph+0wE8YXbxSMcEpCpCCSAJ6FzG0qNiSUe/5EkFGSyHSmTHy36R5BaEyJpIhLP7SkNZ2cDsT93U
	lBXvvS9R35bTN8gtQttmX9p79R+XGWaICl5rCJxoP53OJGFmvmTF4rgtDVe+H7gVktgKW3kuUxm
	GF8yQAWGHO443iSgcGhY3Pn2rurZw5h7KkLc+rb/UXEM2G88ZdoiqTBk+MvhaSlJpP/y4LXDx4v
	f2GgdhuGU6yEp94EbQf34gxEiogTUI27sBl2gBqx1t1jlCyo7InlhT/D5kjmECw+V+2egNMbuu7
	NbWcpu8xEE1Tg3qTcITWs4ArVDJ2kRnJyZMu/7sUrEwZAmfAyG9VKTSi/RsjLSFioWv1sVu/mce
	MEbkO7qK1L/3xCAbf/QAM9hY22VI7I+N/w4lLLEv/e8mfZDR58=
X-Received: by 2002:a05:6102:915:b0:7cc:9d82:61e2 with SMTP id
 ada2fe7eead31-7ce5ccddc23mr173507137.13.1792792674222; Fri, 23 Oct 2026
 14:57:54 -0700 (PDT)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com>
 <20261023-submit-sun6i-dma-lifetime-next-v1-v2-3-c9e07cc44bf8@gmail.com> <atvEczwQ8Xh9vcAI@SMW015318>
In-Reply-To: <atvEczwQ8Xh9vcAI@SMW015318>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 15:57:43 -0600
X-Gm-Features: AclHuK-L8Ck-SoXzjLhjbFwPtYn7ao_X3XL7jMPxi73vlDBLmOhNQMuoUPfGIac
Message-ID: <CADvTj4oF7ENRHQRk5VHVN2nuqxV-+4ss5BrwDvijmcS_HZ_fRQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] dmaengine: sun6i: serialize channel reassignment
 with interrupt handling
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, Maxime Ripard <mripard@kernel.org>, 
	Jens Kuske <jenskuske@gmail.com>, Jean-Francois Moine <moinejf@free.fr>, 
	Hongling Zeng <zenghongling@kylinos.cn>, Chengfeng Ye <cyeaa@connect.ust.hk>, 
	Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 2:33=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> On Fri, Oct 23, 2026 at 12:42:37PM -0600, James Hilliard wrote:
> > The allocator changes vchan->phy and pchan->vchan under sdev->lock, but
> > termination reads the physical channel before taking either lock. The I=
RQ
> > handler also takes an owner snapshot without protecting it. Termination
> > can therefore miss a new assignment or detach an owner while an interru=
pt
> > is about to complete its descriptor. An IRQ status snapshot can survive
> > reassignment and be applied to the next transfer.
> >
> > Use sdev->lock for physical-channel ownership, pending channels and the
> > shared interrupt registers, nesting vc.lock inside it for descriptor
> > lists and cookie updates. Allocate and start each pending channel in on=
e
> > critical section. Read and acknowledge IRQ status under the same outer
> > lock, and protect cyclic notifications as well as ordinary completions.
> >
> > Clear the active descriptor pointer before publishing finite completion
> > to virt-dma, whose tasklet may free it independently of the allocator.
> > An assigned channel without an active descriptor is ready for the
> > allocator to start its next transfer or release it. This replaces the
> > completed-descriptor pointer and keeps residue queries and termination
> > from consulting a descriptor already handed to virt-dma.
> >
> > Mask and clear a stopped channel's IRQs before releasing its ownership,
> > and clear pending status before starting a new descriptor. Schedule the
> > allocator after termination so other pending channels can use the relea=
sed
> > physical channel without depending on another device interrupt.
> >
> > This also keeps process-context acquisitions IRQ-safe. Client callbacks
> > remain outside these locks in the virtual-channel completion tasklet.
> >
> > Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A3=
1 DMA controller")
> > Reported-by: Sashiko <sashiko-bot@kernel.org>
> > Closes: https://lore.kernel.org/r/20260706065650.34B131F00A3A@smtp.kern=
el.org
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
>
> Is it possible split to more small change? And you almost add sdev->lock,
> any place only use vc.lock without sdev->lock?

Yes. virt-dma takes vc.lock alone in vchan_tx_prep(), vchan_tx_submit()
and vchan_complete() to protect its descriptor lists and cookies.

sdev->lock protects physical-channel ownership and shared registers.
The sun6i paths need both locks when updating that state together with
the virt-dma lists and cookies.

>
> Frank
