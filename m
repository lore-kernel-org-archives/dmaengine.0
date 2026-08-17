Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED863F0A9F
	for <dmaengine@vger.kernel.org>; Mon, 17 Aug 2026 23:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787009156; cv=pass; b=j9nps+Pwnbg+Cthwbg+8H61aVg44hXxEtvS11mbD924wZRHZjQrr79vyBBLJ6HM904iDAS3kukNSZ6vfj1j/vD73trvVm99XJiKnzjp6LKcpLdHTgX/4/Oi1D3UxJyv0sJA5fJy9+5j2/yyuPZauTzkxZz4K2XhHPz4QXOemHgw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787009156; c=relaxed/simple;
	bh=g1AzLZyhhmggt5mRW1QxTaJqgkbHRAIppDxF6F5qNoA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ChXT4SfpNoBIFAwrH9m5vz8sV1Cp5FWPzsXzV8An0lkGPy9Sv7gl5QFglJT/zIzrFu9IrDk2bOABfO5DrJiXdnFfb7QSsjt7oaFIc7pHLnjz5lJtvZeLkQ4esz1RsUAN6VA85a0F/Rb6AgLLvPCmeWgG1frZ8yRM8CBQDzEqgnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HxvC+xRM; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HxvC+xRM"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-698aece3d7eso716476a12.1
        for <dmaengine@vger.kernel.org>; Mon, 17 Aug 2026 16:25:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787009153; cv=none;
        d=google.com; s=arc-20260327;
        b=fdRRFh5zByMVHIJio01NAFgYWnVgNrEXnO3VhFA9XTpPDofiClH/5DkQF/MTnLw4we
         IOkS4C9lWS9Z5VxaCp3Dz6a0V4rteoetNisikcDTF1KAXPTG00SZDNXJishIYLwODkkp
         +as27UJyifWulAx2+ZUy+oLprloh5kr9Y6AmUeRTVqPUACtVccgo4rh6xsATs9wsNjoN
         emkMO8OeCz8k0NdDUTPsSOTjrzrBJ3TOfJx02B4/pJj/gj5CTiyeDk//nRhp+PNhspnC
         t5tXlW1g7UGna2jpg97EfIZ2Rs3/rJCLmkPNPQv0u1iZe9U7mA7wJliXWVN/KKfAg5LN
         8jDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g1AzLZyhhmggt5mRW1QxTaJqgkbHRAIppDxF6F5qNoA=;
        fh=Ud8el7XoYkEr6JCqCuT/bf3db1ZCqaQS/yctqnMfMJg=;
        b=S8dW+nMFNIXYCkMwwszWBmIk4lbpayWnvG3PJFmCwa9JrxrT/216CtPzFQtsl2XuNj
         NZT1ZpCy6ugHVzTQvdspVCOatvAuELWEDx9As3QAlraKHCmT7ejGgSbJ81nAbvDj4tg+
         zSpMdpp70HHBqooZIcLiUtS3ycqc148tfabMuj+OkNsSbHj3dQoQnJn6jFwWoIhMrJ4p
         06VDdpfvpFFMLvryDrMSA8xiLBD9VKWyIz6vbPwb1IxS6lc4dn9NoeR7EQRMDxJHtf1m
         42nvFSPP1DCwuufiJ9/G2kQPF+W+bqZGZu7IWPxPaRcuBesYmz0w5pJ3/iccFcsfspgo
         tReg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787009153; x=1787613953; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g1AzLZyhhmggt5mRW1QxTaJqgkbHRAIppDxF6F5qNoA=;
        b=HxvC+xRMUy9+H+wkU3bP+yruTGMlPShIvV6HHKDfNLfGCoGy4GMAbU6ek5zoNNbohd
         a48sCF/lw3PI82GZJg71mxzU9HV6hGie51H9TYQ16VZ7GEJ/LyrjAea41OlHc2PcSE3/
         E/wA8oyBFEXecww4fpC/w7nxyGYLX29aHq3bw01uAwhGeGRx5EZHG9q/FT9m9ciLXLci
         8awfJ/d2DIrEZHWAtriFcmjL5e6X5qGoagTBPuICLYfBBBqPLrcA+NB0cYiSO63mbr3z
         yu2iBcEBYd3b5PHNcrpOaFYn7+Z2CkawwY4uUYh6k9vKCRRKSDvKtwGMZ8J8XHO6jH0W
         62oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787009153; x=1787613953;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g1AzLZyhhmggt5mRW1QxTaJqgkbHRAIppDxF6F5qNoA=;
        b=AVXrYIxYDGcpKL+GuNsnegwUWhgNbj9epdjf4bHq29b9hgPd3vYaOO0qzhgitvskBd
         OzZfP3hhGFQjP6ss543wurpjkuKOduVmMOFVAZ2UD/Je6tFr6iQ2yGMgWabhjOTxCQwX
         +iXqWLC4bHhjdBWZSJn4G3I1eTxhAoO+ELQdXOic4jrYL4NHBzI9K+EXpLYqLYjLgWq7
         CC1lM6WdoaT4Ed8nMvUHsHc0/SvifotoL2sFXz2HiQ4Oh+SFKxXRmGB2lDqWViYZsW0V
         KLdWIa1RdAABZZVBjOfdPHGMNuIJdBYzvTTlMf1ljRy/SRt06JPCzA/+W1psBXiom4zY
         4+ag==
X-Forwarded-Encrypted: i=1; AHgh+RptpwUInCoaYHyz/SF4a4tdCZHU3AQPMPy5of0gaCIMNNQE6fu/QqsnWQLkQC8hyiTJc+qkWW1QvQA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ17qSKvs971CFbd/HE98CuPzepPX1iGF6tIAKbdPFJVOAhiet
	I1rZwdLhIlF6R4Zfdw5J+T57QKKDhc4uXBKaxXRArQHeKWd4pqz62MVhGVKAKRVZclzRFY/Hm0T
	zBV56W2jzvf8W0wYcl6WuiDvmxg+XAEw=
X-Gm-Gg: AR+sD12flZFnEloIUnm+Oj/mlUJfbvYYvb5OrSspUs26R99iJfaCIxIKidF9Gmsds3o
	hebSyvtZE1VJw41eH8a8MEVKRhDC3iAMSm8lHQ3zR710LCat9wzr/rcdaXC3sD+myeDxnuc3Bgq
	M15vxLq6sZAY8cIDsorAYK+SQcwzYzgBcSLN4wyTDDPNkz1oIpcJ+YIDWDXFTcTOj4ZCPu68SA9
	UTYAhUQZfSYOl5VxN/HEAK81bV6Y7k08LlLFbz884hZSdPH+k2YZDLWIjRIMLWhjTDBNFcdaFLc
	WNpP6VNs+AaJj92Sz3e7soY267jiuF3aF2qWcSnoJo16
X-Received: by 2002:a17:907:c1f:b0:c12:e4f7:9a0 with SMTP id
 a640c23a62f3a-c212a17c930mr646591966b.2.1787009152807; Mon, 17 Aug 2026
 16:25:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818-ti-am33-usb-v1-0-69ac5f92df45@gmail.com>
 <20260818-ti-am33-usb-v1-1-69ac5f92df45@gmail.com> <20260817215829.AB4321F00A3A@smtp.kernel.org>
In-Reply-To: <20260817215829.AB4321F00A3A@smtp.kernel.org>
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 18 Aug 2026 04:55:41 +0530
X-Gm-Features: AcwNN1W_ixQgq_Zd-BIBGZqubOpNe4fyzSrpTQJ0Cu1HvNeHF6H9Fw8rcF7uO0c
Message-ID: <CAOWyW_4YmQ=Dkd9Wr57wxCfWJKmFVOA7BL9fkTiu7NcL=gFFtA@mail.gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: dma: ti,cppi41: Convert to DT schema
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, neil.armstrong@linaro.org, 
	linux-phy@lists.infradead.org, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, vkoul@kernel.org, robh@kernel.org, 
	olteanv@gmail.com, Frank.Li@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 3:28=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] The newly added deprecated properties `#dma-channels` and `#dm=
a-requests` lack a type reference, which will cause `dt_binding_check` to f=
ail.
anything that starts with # dtschema already defines this as
single-cell so no need for any $ref

> - [Medium] The `interrupts` property is strictly required by the hardware=
 and driver but is missing from the global or variant-specific `required` l=
ists, while `interrupt-names` is required without `interrupts`.
yes , will fix in v2
